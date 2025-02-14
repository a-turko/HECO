module  {
  func.func private @encryptedL2Distance_4(%arg0: tensor<4x!fhe.secret<i16>>, %arg1: tensor<4x!fhe.secret<i16>>) -> !fhe.secret<i16> {
    %c0 = arith.constant 0 : index
    %c0_si16 = fhe.constant 0 : i16
    %0 = affine.for %i = 0 to 4 iter_args(%arg6 = %c0_si16) -> (!fhe.secret<i16>) {
      %1 = tensor.extract %arg0[%i] : tensor<4x!fhe.secret<i16>>
      %2 = tensor.extract %arg1[%i] : tensor<4x!fhe.secret<i16>>
      %3 = fhe.sub(%1, %2) : (!fhe.secret<i16>, !fhe.secret<i16>) -> !fhe.secret<i16>
      %4 = tensor.extract %arg0[%i] : tensor<4x!fhe.secret<i16>>
      %5 = tensor.extract %arg1[%i] : tensor<4x!fhe.secret<i16>>
      %6 = fhe.sub(%4, %5) : (!fhe.secret<i16>, !fhe.secret<i16>) -> !fhe.secret<i16>
      %7 = fhe.multiply(%3, %6) : (!fhe.secret<i16>, !fhe.secret<i16>) -> !fhe.secret<i16>
      %8 = fhe.add(%arg6, %7) : (!fhe.secret<i16>, !fhe.secret<i16>) -> !fhe.secret<i16>
      affine.yield %8 : !fhe.secret<i16>
    }
    return %0 : !fhe.secret<i16>
  }
}