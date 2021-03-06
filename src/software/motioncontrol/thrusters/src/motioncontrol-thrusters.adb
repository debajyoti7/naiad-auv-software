with Exception_Handling;

package body MotionControl.Thrusters is

   --------------
   -- pxCreate --
   --------------

   function pxCreate (tfThrusterEffects : in TThrusterEffects) return pCThruster is
      pxNewThruster : pCThruster;
   begin
      pxNewThruster := new CThruster;
      pxNewThruster.pxNextThruster := null;
      pxNewThruster.tfThrusterEffects := tfThrusterEffects;
      return pxNewThruster;
   end pxCreate;

   ----------------
   -- iGet_Count --
   ----------------

   function iGet_Count (this : in CThruster) return integer is
   begin
      if this.pxNextThruster /= null then
         return this.pxNextThruster.iGet_Count + 1;
      end if;

      return 1;
   end iGet_Count;

   -------------------------------
   -- Add_Thruster_With_Effects --
   -------------------------------

   procedure Add_Thruster_With_Effects
     (this : in out CThruster;
      tfThrusterEffects : in TThrusterEffects)
   is
   begin
      if this.pxNextThruster = null then
         this.pxNextThruster := pxCreate(tfThrusterEffects);
      else
         this.pxNextThruster.Add_Thruster_With_Effects(tfThrusterEffects);
      end if;
   end Add_Thruster_With_Effects;

   procedure Change_Thruster_Effects
     (this : in out CThruster;
      iThrusterIndex : in integer;
      tfThrusterEffects : in TThrusterEffects)
   is

   begin
      if iThrusterIndex - 1 = 0 then
         this.tfThrusterEffects := tfThrusterEffects;
      else
         if this.pxNextThruster /= null then
            this.pxNextThruster.Change_Thruster_Effects(iThrusterIndex - 1, tfThrusterEffects);
         else
            Exception_Handling.Raise_Exception(E       => Exception_Handling.IndexOutOfBounds'Identity,
                                               Message => "MotionControl.Thrusters.Change_Thruster_Effects");
         end if;

      end if;

   end;

   -----------------------------------
   -- txGet_Thruster_Effects_Matrix --
   -----------------------------------

   function txGet_Thruster_Effects_Matrix
     (this : in CThruster)
      return TThrusterEffectsMatrix
   is
      txThrusterEffectsMatrix : TThrusterEffectsMatrix;
   begin
      txThrusterEffectsMatrix := (others => (others => 0.0));
      this.Put_Thruster_Effects_Into_Matrix(txThrusterEffectsMatrix, 1);
      return txThrusterEffectsMatrix;
   end txGet_Thruster_Effects_Matrix;

   -----------------------------
   -- tfMake_Thruster_Effects --
   -----------------------------

   function tfMake_Thruster_Effects
     (fXPosition, fYPosition, FZPosition, fXRotation, fYRotation, fZRotation : in float)
      return TThrusterEffects
   is
      tfNewThrusterEffects : TThrusterEffects;
   begin
      tfNewThrusterEffects(XPosition) := fXPosition;
      tfNewThrusterEffects(YPosition) := fYPosition;
      tfNewThrusterEffects(ZPosition) := fZPosition;
      tfNewThrusterEffects(XRotation) := fXRotation;
      tfNewThrusterEffects(YRotation) := fYRotation;
      tfNewThrusterEffects(ZRotation) := fZRotation;

      return tfNewThrusterEffects;
   end tfMake_Thruster_Effects;

   --------------------------------------
   -- Put_Thruster_Effects_Into_Matrix --
   --------------------------------------

   procedure Put_Thruster_Effects_Into_Matrix
     (this : in CThruster;
      txThrusterEffectsMatrix : in out TThrusterEffectsMatrix;
      iThrusterIndex : in integer)
   is
   begin
      for i in XPosition .. ZRotation
      loop
         txThrusterEffectsMatrix(iThrusterIndex)(i) := this.tfThrusterEffects(i);
      end loop;

      if this.pxNextThruster /= null then
         this.pxNextThruster.Put_Thruster_Effects_Into_Matrix(txThrusterEffectsMatrix, iThrusterIndex + 1);
      end if;

   end Put_Thruster_Effects_Into_Matrix;

   function "+" (tfLeftOperand : in TThrusterEffects; tfRightOperand : in TThrusterEffects) return TThrusterEffects is
   begin
      return TThrusterEffects'(tfLeftOperand(XPosition) + tfRightOperand(XPosition),
                               tfLeftOperand(YPosition) + tfRightOperand(YPosition),
                               tfLeftOperand(ZPosition) + tfRightOperand(ZPosition),
                               tfLeftOperand(XRotation) + tfRightOperand(XRotation),
                               tfLeftOperand(YRotation) + tfRightOperand(YRotation),
                               tfLeftOperand(ZRotation) + tfRightOperand(ZRotation));

   end "+";


   procedure Free(pxThrusterToDeallocate : in out pCThruster) is

      procedure Dealloc is new Ada.Unchecked_Deallocation(CThruster, pCThruster);

   begin
      Dealloc(pxThrusterToDeallocate);
   end Free;

   procedure Finalize(this : in out CThruster) is
   begin
      if this.pxNextThruster /= null then
         Free(this.pxNextThruster);
      end if;

   end Finalize;

end MotionControl.Thrusters;
