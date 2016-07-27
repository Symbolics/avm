#|
  This file is a part of avm project.
  Copyright (c) 2016 Masayuki Takagi (kamonama@gmail.com)
|#

(in-package :cl-user)
(defpackage avm.lang.compiler.cuda.built-in
  (:use :cl
        :avm
        :avm.lang.built-in)
  (:export))
(in-package :avm.lang.compiler.cuda.built-in)


(defmethod built-in-functions ((engine (eql :cuda)))
  '((+ (a a a)
     (((int int int) +)
      (((:vector int 2) (:vector int 2) (:vector int 2)) +)
      (((:vector int 3) (:vector int 3) (:vector int 3)) +)
      (((:vector int 4) (:vector int 4) (:vector int 4)) +)
      ((float float float) +)
      (((:vector float 2) (:vector float 2) (:vector float 2)) +)
      (((:vector float 3) (:vector float 3) (:vector float 3)) +)
      (((:vector float 4) (:vector float 4) (:vector float 4)) +)
      ((double double double) +)
      (((:vector double 2) (:vector double 2) (:vector double 2)) +)
      (((:vector double 3) (:vector double 3) (:vector double 3)) +)
      (((:vector double 4) (:vector double 4) (:vector double 4)) +)
      ))
    (- (a a a)
     (((int int int) -)
      (((:vector int 2) (:vector int 2) (:vector int 2)) -)
      (((:vector int 3) (:vector int 3) (:vector int 3)) -)
      (((:vector int 4) (:vector int 4) (:vector int 4)) -)
      ((float float float) -)
      (((:vector float 2) (:vector float 2) (:vector float 2)) -)
      (((:vector float 3) (:vector float 3) (:vector float 3)) -)
      (((:vector float 4) (:vector float 4) (:vector float 4)) -)
      ((double double double) -)
      (((:vector double 2) (:vector double 2) (:vector double 2)) -)
      (((:vector double 3) (:vector double 3) (:vector double 3)) -)
      (((:vector double 4) (:vector double 4) (:vector double 4)) -)
      ))
    (* (a a a) (((int int int) *)
                ((float float float) *)
                ((double double double) *)))
    (/ (a a a) (((int int int) /)
                ((float float float) /)
                ((double double double) /)))
    (*. ((:vector a b) a (:vector a b))
        ((((:vector int 2) int (:vector int 2)) *)
         (((:vector int 3) int (:vector int 3)) *)
         (((:vector int 4) int (:vector int 4)) *)
         (((:vector float 2) float (:vector float 2)) *)
         (((:vector float 3) float (:vector float 3)) *)
         (((:vector float 4) float (:vector float 4)) *)
         (((:vector double 2) double (:vector double 2)) *)
         (((:vector double 3) double (:vector double 3)) *)
         (((:vector double 4) double (:vector double 4)) *)))
    (.* (a (:vector a b) (:vector a b))
        (((int (:vector int 2) (:vector int 2)) *)
         ((int (:vector int 3) (:vector int 3)) *)
         ((int (:vector int 4) (:vector int 4)) *)
         ((float (:vector float 2) (:vector float 2)) *)
         ((float (:vector float 3) (:vector float 3)) *)
         ((float (:vector float 4) (:vector float 4)) *)
         ((double (:vector double 2) (:vector double 2)) *)
         ((double (:vector double 3) (:vector double 3)) *)
         ((double (:vector double 4) (:vector double 4)) *)))
    (/. ((:vector a b) a (:vector a b))
        (;(((:vector int 2) int (:vector int 2)) /)
         ;(((:vector int 3) int (:vector int 3)) /)
         ;(((:vector int 4) int (:vector int 4)) /)
         (((:vector float 2) float (:vector float 2)) /)
         (((:vector float 3) float (:vector float 3)) /)
         (((:vector float 4) float (:vector float 4)) /)
         (((:vector double 2) double (:vector double 2)) /)
         (((:vector double 3) double (:vector double 3)) /)
         (((:vector double 4) double (:vector double 4)) /)))
    (< (a a bool) (((int int bool) <)
                   ((float float bool) <)
                   ((doublet double bool) <)))
    (> (a a bool) (((int int bool) >)
                   ((float float bool) >)
                   ((double double bool) >)))
    ;; (int2 (int int (:vector int 2))
    ;;       (((int int (:vector int 2)) cl-cuda:int2)))
    ;; (int3 (int int int (:vector int 3))
    ;;       (((int int int (:vector int 3)) cl-cuda:int3)))
    ;; (int4 (int int int int (:vector int 4))
    ;;       (((int int int int (:vector int 4)) cl-cuda:int4)))
    ;; (float2 (float float (:vector float 2))
    ;;         (((float float (:vector float 2)) cl-cuda:float2)))
    (float3 (float float float (:vector float 3))
            (((float float float (:vector float 3)) cl-cuda:float3)))
    (float4 (float float float float (:vector float 4))
            (((float float float float (:vector float 4)) cl-cuda:float4)))
    ;; (double2 (double double (:vector double 2))
    ;;          (((double double (:vector double 2)) cl-cuda:double2)))
    (double3 (double double double (:vector double 3))
             (((double double double (:vector double 3)) cl-cuda:double3)))
    (double4 (double double double double (:vector double 4))
             (((double double double double (:vector double 4))
               cl-cuda:double4)))
    ;; (int2-x ((:vector int 2) int)
    ;;         ((((:vector int 2) int) cl-cuda:int2-x)))
    ;; (int2-y ((:vector int 2) int)
    ;;         ((((:vector int 2) int) cl-cuda:int2-y)))
    ;; (int3-x ((:vector int 3) int)
    ;;         ((((:vector int 3) int) cl-cuda:int3-x)))
    ;; (int3-y ((:vector int 3) int)
    ;;         ((((:vector int 3) int) cl-cuda:int3-y)))
    ;; (int3-z ((:vector int 3) int)
    ;;         ((((:vector int 3) int) cl-cuda:int3-z)))
    ;; (int4-x ((:vector int 4) int)
    ;;         ((((:vector int 4) int) cl-cuda:int4-x)))
    ;; (int4-y ((:vector int 4) int)
    ;;         ((((:vector int 4) int) cl-cuda:int4-y)))
    ;; (int4-z ((:vector int 4) int)
    ;;         ((((:vector int 4) int) cl-cuda:int4-z)))
    ;; (int4-w ((:vector int 4) int)
    ;;         ((((:vector int 4) int) cl-cuda:int4-w)))
    ;; (float2-x ((:vector float 2) float)
    ;;           ((((:vector float 2) float) cl-cuda:float2-x)))
    ;; (float2-y ((:vector float 2) float)
    ;;           ((((:vector float 2) float) cl-cuda:float2-y)))
    (float3-x ((:vector float 3) float)
              ((((:vector float 3) float) cl-cuda:float3-x)))
    (float3-y ((:vector float 3) float)
              ((((:vector float 3) float) cl-cuda:float3-y)))
    (float3-z ((:vector float 3) float)
              ((((:vector float 3) float) cl-cuda:float3-z)))
    (float4-x ((:vector float 4) float)
              ((((:vector float 4) float) cl-cuda:float4-x)))
    (float4-y ((:vector float 4) float)
              ((((:vector float 4) float) cl-cuda:float4-y)))
    (float4-z ((:vector float 4) float)
              ((((:vector float 4) float) cl-cuda:float4-z)))
    (float4-w ((:vector float 4) float)
              ((((:vector float 4) float) cl-cuda:float4-w)))
    ;; (double2-x ((:vector double 2) double)
    ;;            ((((:vector double 2) double) cl-cuda:double2-x)))
    ;; (double2-y ((:vector double 2) double)
    ;;            ((((:vector double 2) double) cl-cuda:double2-y)))
    (double3-x ((:vector double 3) double)
               ((((:vector double 3) double) cl-cuda:double3-x)))
    (double3-y ((:vector double 3) double)
               ((((:vector double 3) double) cl-cuda:double3-y)))
    (double3-z ((:vector double 3) double)
               ((((:vector double 3) double) cl-cuda:double3-z)))
    (double4-x ((:vector double 4) double)
               ((((:vector double 4) double) cl-cuda:double4-x)))
    (double4-y ((:vector double 4) double)
               ((((:vector double 4) double) cl-cuda:double4-y)))
    (double4-z ((:vector double 4) double)
               ((((:vector double 4) double) cl-cuda:double4-z)))
    (double4-w ((:vector double 4) double)
               ((((:vector double 4) double) cl-cuda:double4-w)))
    (aref ((:array a) int a)
          ((((:array int) int int) aref)
           (((:array (:vector int 2)) int (:vector int 2)) aref)
           (((:array (:vector int 3)) int (:vector int 3)) aref)
           (((:array (:vector int 4)) int (:vector int 4)) aref)
           (((:array float) int float) aref)
           (((:array (:vector float 2)) int (:vector float 2)) aref)
           (((:array (:vector float 3)) int (:vector float 3)) aref)
           (((:array (:vector float 4)) int (:vector float 4)) aref)
           (((:array double) int double) aref)
           (((:array (:vector double 2)) int (:vector double 2)) aref)
           (((:array (:vector double 3)) int (:vector double 3)) aref)
           (((:array (:vector double 4)) int (:vector double 4)) aref)
           ))
    (mod (int int int) (((int int int) cl-cuda::mod)))
    (coerce (a b) (((int float) cl-cuda::coerce)))
    ;; (coerce (a b) (((int float) int->float)
    ;;                ((int double) int->double)
    ;;                ((float double) float->double)))
    ;; Mathematical functions.
    (rsqrt (a a) (((float float) cl-cuda:rsqrt)
                  ((double double) cl-cuda:rsqrt)))
    ;; (norm ((:vector a _) a)
    ;;       (;(((:vector int 2) int) cl-cuda:norm)
    ;;        ;(((:vector int 3) int) cl-cuda:norm)
    ;;        ;(((:vector int 4) int) cl-cuda:norm)
    ;;        (((:vector float 2) float) cl-cuda:norm)
    ;;        (((:vector float 3) float) cl-cuda:norm)
    ;;        (((:vector float 4) float) cl-cuda:norm)
    ;;        (((:vector double 2) double) cl-cuda:norm)
    ;;        (((:vector double 3) double) cl-cuda:norm)
    ;;        (((:vector double 4) double) cl-cuda:norm)))
    ))
