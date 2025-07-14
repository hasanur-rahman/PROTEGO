; ModuleID = 'ex_particle_OPENMP_seq.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@M = global i64 2147483647, align 8
@A = global i32 1103515245, align 4
@C = global i32 12345, align 4
@.str = private unnamed_addr constant [11 x i8] c"result.txt\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str2 = private unnamed_addr constant [11 x i8] c"XE: %.4lf\0A\00", align 1
@.str3 = private unnamed_addr constant [11 x i8] c"YE: %.4lf\0A\00", align 1
@.str4 = private unnamed_addr constant [17 x i8] c"Distance: %.4lf\0A\00", align 1
@.str5 = private unnamed_addr constant [57 x i8] c"openmp.out -x <dimX> -y <dimY> -z <Nfr> -np <Nparticles>\00", align 1
@.str6 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str7 = private unnamed_addr constant [3 x i8] c"-x\00", align 1
@.str8 = private unnamed_addr constant [3 x i8] c"-y\00", align 1
@.str9 = private unnamed_addr constant [3 x i8] c"-z\00", align 1
@.str10 = private unnamed_addr constant [4 x i8] c"-np\00", align 1
@.str11 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str12 = private unnamed_addr constant [31 x i8] c"ERROR: dimX input is incorrect\00", align 1
@.str13 = private unnamed_addr constant [18 x i8] c"dimX must be > 0\0A\00", align 1
@.str14 = private unnamed_addr constant [31 x i8] c"ERROR: dimY input is incorrect\00", align 1
@.str15 = private unnamed_addr constant [18 x i8] c"dimY must be > 0\0A\00", align 1
@.str16 = private unnamed_addr constant [43 x i8] c"ERROR: Number of frames input is incorrect\00", align 1
@.str17 = private unnamed_addr constant [30 x i8] c"number of frames must be > 0\0A\00", align 1
@.str18 = private unnamed_addr constant [46 x i8] c"ERROR: Number of particles input is incorrect\00", align 1
@.str19 = private unnamed_addr constant [33 x i8] c"Number of particles must be > 0\0A\00", align 1

; Function Attrs: nounwind uwtable
define double @roundDouble(double %value) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %newValue = alloca i32, align 4
  store double %value, double* %2, align 8
  %3 = load double* %2, align 8
  %4 = fptosi double %3 to i32
  store i32 %4, i32* %newValue, align 4
  %5 = load double* %2, align 8
  %6 = load i32* %newValue, align 4
  %7 = sitofp i32 %6 to double
  %8 = fsub double %5, %7
  %9 = fcmp olt double %8, 5.000000e-01
  br i1 %9, label %10, label %13

; <label>:10                                      ; preds = %0
  %11 = load i32* %newValue, align 4
  %12 = sitofp i32 %11 to double
  store double %12, double* %1
  br label %17

; <label>:13                                      ; preds = %0
  %14 = load i32* %newValue, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %newValue, align 4
  %16 = sitofp i32 %14 to double
  store double %16, double* %1
  br label %17

; <label>:17                                      ; preds = %13, %10
  %18 = load double* %1
  ret double %18
}

; Function Attrs: nounwind uwtable
define void @setIf(i32 %testValue, i32 %newValue, i32* %array3D, i32* %dimX, i32* %dimY, i32* %dimZ) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 %testValue, i32* %1, align 4
  store i32 %newValue, i32* %2, align 4
  store i32* %array3D, i32** %3, align 8
  store i32* %dimX, i32** %4, align 8
  store i32* %dimY, i32** %5, align 8
  store i32* %dimZ, i32** %6, align 8
  store i32 0, i32* %x, align 4
  br label %7

; <label>:7                                       ; preds = %73, %0
  %8 = load i32* %x, align 4
  %9 = load i32** %4, align 8
  %10 = load i32* %9, align 4
  %11 = icmp slt i32 %8, %10
  br i1 %11, label %12, label %76

; <label>:12                                      ; preds = %7
  store i32 0, i32* %y, align 4
  br label %13

; <label>:13                                      ; preds = %69, %12
  %14 = load i32* %y, align 4
  %15 = load i32** %5, align 8
  %16 = load i32* %15, align 4
  %17 = icmp slt i32 %14, %16
  br i1 %17, label %18, label %72

; <label>:18                                      ; preds = %13
  store i32 0, i32* %z, align 4
  br label %19

; <label>:19                                      ; preds = %65, %18
  %20 = load i32* %z, align 4
  %21 = load i32** %6, align 8
  %22 = load i32* %21, align 4
  %23 = icmp slt i32 %20, %22
  br i1 %23, label %24, label %68

; <label>:24                                      ; preds = %19
  %25 = load i32* %x, align 4
  %26 = load i32** %5, align 8
  %27 = load i32* %26, align 4
  %28 = mul nsw i32 %25, %27
  %29 = load i32** %6, align 8
  %30 = load i32* %29, align 4
  %31 = mul nsw i32 %28, %30
  %32 = load i32* %y, align 4
  %33 = load i32** %6, align 8
  %34 = load i32* %33, align 4
  %35 = mul nsw i32 %32, %34
  %36 = add nsw i32 %31, %35
  %37 = load i32* %z, align 4
  %38 = add nsw i32 %36, %37
  %39 = sext i32 %38 to i64
  %40 = load i32** %3, align 8
  %41 = getelementptr inbounds i32* %40, i64 %39
  %42 = load i32* %41, align 4
  %43 = load i32* %1, align 4
  %44 = icmp eq i32 %42, %43
  br i1 %44, label %45, label %64

; <label>:45                                      ; preds = %24
  %46 = load i32* %2, align 4
  %47 = load i32* %x, align 4
  %48 = load i32** %5, align 8
  %49 = load i32* %48, align 4
  %50 = mul nsw i32 %47, %49
  %51 = load i32** %6, align 8
  %52 = load i32* %51, align 4
  %53 = mul nsw i32 %50, %52
  %54 = load i32* %y, align 4
  %55 = load i32** %6, align 8
  %56 = load i32* %55, align 4
  %57 = mul nsw i32 %54, %56
  %58 = add nsw i32 %53, %57
  %59 = load i32* %z, align 4
  %60 = add nsw i32 %58, %59
  %61 = sext i32 %60 to i64
  %62 = load i32** %3, align 8
  %63 = getelementptr inbounds i32* %62, i64 %61
  store i32 %46, i32* %63, align 4
  br label %64

; <label>:64                                      ; preds = %45, %24
  br label %65

; <label>:65                                      ; preds = %64
  %66 = load i32* %z, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %z, align 4
  br label %19

; <label>:68                                      ; preds = %19
  br label %69

; <label>:69                                      ; preds = %68
  %70 = load i32* %y, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, i32* %y, align 4
  br label %13

; <label>:72                                      ; preds = %13
  br label %73

; <label>:73                                      ; preds = %72
  %74 = load i32* %x, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %x, align 4
  br label %7

; <label>:76                                      ; preds = %7
  ret void
}

; Function Attrs: nounwind uwtable
define double @randu(i32* %seed, i32 %index) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %num = alloca i64, align 8
  store i32* %seed, i32** %1, align 8
  store i32 %index, i32* %2, align 4
  %3 = load i32* @A, align 4
  %4 = sext i32 %3 to i64
  %5 = load i32* %2, align 4
  %6 = sext i32 %5 to i64
  %7 = load i32** %1, align 8
  %8 = getelementptr inbounds i32* %7, i64 %6
  %9 = load i32* %8, align 4
  %10 = sext i32 %9 to i64
  %11 = mul nsw i64 %4, %10
  %12 = load i32* @C, align 4
  %13 = sext i32 %12 to i64
  %14 = add nsw i64 %11, %13
  store i64 %14, i64* %num, align 8
  %15 = load i64* %num, align 8
  %16 = load i64* @M, align 8
  %17 = srem i64 %15, %16
  %18 = trunc i64 %17 to i32
  %19 = load i32* %2, align 4
  %20 = sext i32 %19 to i64
  %21 = load i32** %1, align 8
  %22 = getelementptr inbounds i32* %21, i64 %20
  store i32 %18, i32* %22, align 4
  %23 = load i32* %2, align 4
  %24 = sext i32 %23 to i64
  %25 = load i32** %1, align 8
  %26 = getelementptr inbounds i32* %25, i64 %24
  %27 = load i32* %26, align 4
  %28 = sitofp i32 %27 to double
  %29 = load i64* @M, align 8
  %30 = sitofp i64 %29 to double
  %31 = fdiv double %28, %30
  %32 = call double @fabs(double %31) #5
  ret double %32
}

; Function Attrs: nounwind readnone
declare double @fabs(double) #1

; Function Attrs: nounwind uwtable
define double @randn(i32* %seed, i32 %index) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %u = alloca double, align 8
  %v = alloca double, align 8
  %cosine = alloca double, align 8
  %rt = alloca double, align 8
  store i32* %seed, i32** %1, align 8
  store i32 %index, i32* %2, align 4
  %3 = load i32** %1, align 8
  %4 = load i32* %2, align 4
  %5 = call double @randu(i32* %3, i32 %4)
  store double %5, double* %u, align 8
  %6 = load i32** %1, align 8
  %7 = load i32* %2, align 4
  %8 = call double @randu(i32* %6, i32 %7)
  store double %8, double* %v, align 8
  %9 = call double @acos(double -1.000000e+00) #6
  %10 = fmul double 2.000000e+00, %9
  %11 = load double* %v, align 8
  %12 = fmul double %10, %11
  %13 = call double @cos(double %12) #6
  store double %13, double* %cosine, align 8
  %14 = load double* %u, align 8
  %15 = call double @log(double %14) #6
  %16 = fmul double -2.000000e+00, %15
  store double %16, double* %rt, align 8
  %17 = load double* %rt, align 8
  %18 = call double @sqrt(double %17) #6
  %19 = load double* %cosine, align 8
  %20 = fmul double %18, %19
  ret double %20
}

; Function Attrs: nounwind
declare double @cos(double) #2

; Function Attrs: nounwind
declare double @acos(double) #2

; Function Attrs: nounwind
declare double @log(double) #2

; Function Attrs: nounwind
declare double @sqrt(double) #2

; Function Attrs: nounwind uwtable
define void @addNoise(i32* %array3D, i32* %dimX, i32* %dimY, i32* %dimZ, i32* %seed) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  store i32* %array3D, i32** %1, align 8
  store i32* %dimX, i32** %2, align 8
  store i32* %dimY, i32** %3, align 8
  store i32* %dimZ, i32** %4, align 8
  store i32* %seed, i32** %5, align 8
  store i32 0, i32* %x, align 4
  br label %6

; <label>:6                                       ; preds = %72, %0
  %7 = load i32* %x, align 4
  %8 = load i32** %2, align 8
  %9 = load i32* %8, align 4
  %10 = icmp slt i32 %7, %9
  br i1 %10, label %11, label %75

; <label>:11                                      ; preds = %6
  store i32 0, i32* %y, align 4
  br label %12

; <label>:12                                      ; preds = %68, %11
  %13 = load i32* %y, align 4
  %14 = load i32** %3, align 8
  %15 = load i32* %14, align 4
  %16 = icmp slt i32 %13, %15
  br i1 %16, label %17, label %71

; <label>:17                                      ; preds = %12
  store i32 0, i32* %z, align 4
  br label %18

; <label>:18                                      ; preds = %64, %17
  %19 = load i32* %z, align 4
  %20 = load i32** %4, align 8
  %21 = load i32* %20, align 4
  %22 = icmp slt i32 %19, %21
  br i1 %22, label %23, label %67

; <label>:23                                      ; preds = %18
  %24 = load i32* %x, align 4
  %25 = load i32** %3, align 8
  %26 = load i32* %25, align 4
  %27 = mul nsw i32 %24, %26
  %28 = load i32** %4, align 8
  %29 = load i32* %28, align 4
  %30 = mul nsw i32 %27, %29
  %31 = load i32* %y, align 4
  %32 = load i32** %4, align 8
  %33 = load i32* %32, align 4
  %34 = mul nsw i32 %31, %33
  %35 = add nsw i32 %30, %34
  %36 = load i32* %z, align 4
  %37 = add nsw i32 %35, %36
  %38 = sext i32 %37 to i64
  %39 = load i32** %1, align 8
  %40 = getelementptr inbounds i32* %39, i64 %38
  %41 = load i32* %40, align 4
  %42 = load i32** %5, align 8
  %43 = call double @randn(i32* %42, i32 0)
  %44 = fmul double 5.000000e+00, %43
  %45 = fptosi double %44 to i32
  %46 = add nsw i32 %41, %45
  %47 = load i32* %x, align 4
  %48 = load i32** %3, align 8
  %49 = load i32* %48, align 4
  %50 = mul nsw i32 %47, %49
  %51 = load i32** %4, align 8
  %52 = load i32* %51, align 4
  %53 = mul nsw i32 %50, %52
  %54 = load i32* %y, align 4
  %55 = load i32** %4, align 8
  %56 = load i32* %55, align 4
  %57 = mul nsw i32 %54, %56
  %58 = add nsw i32 %53, %57
  %59 = load i32* %z, align 4
  %60 = add nsw i32 %58, %59
  %61 = sext i32 %60 to i64
  %62 = load i32** %1, align 8
  %63 = getelementptr inbounds i32* %62, i64 %61
  store i32 %46, i32* %63, align 4
  br label %64

; <label>:64                                      ; preds = %23
  %65 = load i32* %z, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, i32* %z, align 4
  br label %18

; <label>:67                                      ; preds = %18
  br label %68

; <label>:68                                      ; preds = %67
  %69 = load i32* %y, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %y, align 4
  br label %12

; <label>:71                                      ; preds = %12
  br label %72

; <label>:72                                      ; preds = %71
  %73 = load i32* %x, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %x, align 4
  br label %6

; <label>:75                                      ; preds = %6
  ret void
}

; Function Attrs: nounwind uwtable
define void @strelDisk(i32* %disk, i32 %radius) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %diameter = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %distance = alloca double, align 8
  store i32* %disk, i32** %1, align 8
  store i32 %radius, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = mul nsw i32 %3, 2
  %5 = sub nsw i32 %4, 1
  store i32 %5, i32* %diameter, align 4
  store i32 0, i32* %x, align 4
  br label %6

; <label>:6                                       ; preds = %48, %0
  %7 = load i32* %x, align 4
  %8 = load i32* %diameter, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %51

; <label>:10                                      ; preds = %6
  store i32 0, i32* %y, align 4
  br label %11

; <label>:11                                      ; preds = %44, %10
  %12 = load i32* %y, align 4
  %13 = load i32* %diameter, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %47

; <label>:15                                      ; preds = %11
  %16 = load i32* %x, align 4
  %17 = load i32* %2, align 4
  %18 = sub nsw i32 %16, %17
  %19 = add nsw i32 %18, 1
  %20 = sitofp i32 %19 to double
  %21 = call double @pow(double %20, double 2.000000e+00) #6
  %22 = load i32* %y, align 4
  %23 = load i32* %2, align 4
  %24 = sub nsw i32 %22, %23
  %25 = add nsw i32 %24, 1
  %26 = sitofp i32 %25 to double
  %27 = call double @pow(double %26, double 2.000000e+00) #6
  %28 = fadd double %21, %27
  %29 = call double @sqrt(double %28) #6
  store double %29, double* %distance, align 8
  %30 = load double* %distance, align 8
  %31 = load i32* %2, align 4
  %32 = sitofp i32 %31 to double
  %33 = fcmp olt double %30, %32
  br i1 %33, label %34, label %43

; <label>:34                                      ; preds = %15
  %35 = load i32* %x, align 4
  %36 = load i32* %diameter, align 4
  %37 = mul nsw i32 %35, %36
  %38 = load i32* %y, align 4
  %39 = add nsw i32 %37, %38
  %40 = sext i32 %39 to i64
  %41 = load i32** %1, align 8
  %42 = getelementptr inbounds i32* %41, i64 %40
  store i32 1, i32* %42, align 4
  br label %43

; <label>:43                                      ; preds = %34, %15
  br label %44

; <label>:44                                      ; preds = %43
  %45 = load i32* %y, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %y, align 4
  br label %11

; <label>:47                                      ; preds = %11
  br label %48

; <label>:48                                      ; preds = %47
  %49 = load i32* %x, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %x, align 4
  br label %6

; <label>:51                                      ; preds = %6
  ret void
}

; Function Attrs: nounwind
declare double @pow(double, double) #2

; Function Attrs: nounwind uwtable
define void @dilate_matrix(i32* %matrix, i32 %posX, i32 %posY, i32 %posZ, i32 %dimX, i32 %dimY, i32 %dimZ, i32 %error) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %startX = alloca i32, align 4
  %startY = alloca i32, align 4
  %endX = alloca i32, align 4
  %endY = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %distance = alloca double, align 8
  store i32* %matrix, i32** %1, align 8
  store i32 %posX, i32* %2, align 4
  store i32 %posY, i32* %3, align 4
  store i32 %posZ, i32* %4, align 4
  store i32 %dimX, i32* %5, align 4
  store i32 %dimY, i32* %6, align 4
  store i32 %dimZ, i32* %7, align 4
  store i32 %error, i32* %8, align 4
  %9 = load i32* %2, align 4
  %10 = load i32* %8, align 4
  %11 = sub nsw i32 %9, %10
  store i32 %11, i32* %startX, align 4
  br label %12

; <label>:12                                      ; preds = %15, %0
  %13 = load i32* %startX, align 4
  %14 = icmp slt i32 %13, 0
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %12
  %16 = load i32* %startX, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %startX, align 4
  br label %12

; <label>:18                                      ; preds = %12
  %19 = load i32* %3, align 4
  %20 = load i32* %8, align 4
  %21 = sub nsw i32 %19, %20
  store i32 %21, i32* %startY, align 4
  br label %22

; <label>:22                                      ; preds = %25, %18
  %23 = load i32* %startY, align 4
  %24 = icmp slt i32 %23, 0
  br i1 %24, label %25, label %28

; <label>:25                                      ; preds = %22
  %26 = load i32* %startY, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %startY, align 4
  br label %22

; <label>:28                                      ; preds = %22
  %29 = load i32* %2, align 4
  %30 = load i32* %8, align 4
  %31 = add nsw i32 %29, %30
  store i32 %31, i32* %endX, align 4
  br label %32

; <label>:32                                      ; preds = %36, %28
  %33 = load i32* %endX, align 4
  %34 = load i32* %5, align 4
  %35 = icmp sgt i32 %33, %34
  br i1 %35, label %36, label %39

; <label>:36                                      ; preds = %32
  %37 = load i32* %endX, align 4
  %38 = add nsw i32 %37, -1
  store i32 %38, i32* %endX, align 4
  br label %32

; <label>:39                                      ; preds = %32
  %40 = load i32* %3, align 4
  %41 = load i32* %8, align 4
  %42 = add nsw i32 %40, %41
  store i32 %42, i32* %endY, align 4
  br label %43

; <label>:43                                      ; preds = %47, %39
  %44 = load i32* %endY, align 4
  %45 = load i32* %6, align 4
  %46 = icmp sgt i32 %44, %45
  br i1 %46, label %47, label %50

; <label>:47                                      ; preds = %43
  %48 = load i32* %endY, align 4
  %49 = add nsw i32 %48, -1
  store i32 %49, i32* %endY, align 4
  br label %43

; <label>:50                                      ; preds = %43
  %51 = load i32* %startX, align 4
  store i32 %51, i32* %x, align 4
  br label %52

; <label>:52                                      ; preds = %99, %50
  %53 = load i32* %x, align 4
  %54 = load i32* %endX, align 4
  %55 = icmp slt i32 %53, %54
  br i1 %55, label %56, label %102

; <label>:56                                      ; preds = %52
  %57 = load i32* %startY, align 4
  store i32 %57, i32* %y, align 4
  br label %58

; <label>:58                                      ; preds = %95, %56
  %59 = load i32* %y, align 4
  %60 = load i32* %endY, align 4
  %61 = icmp slt i32 %59, %60
  br i1 %61, label %62, label %98

; <label>:62                                      ; preds = %58
  %63 = load i32* %x, align 4
  %64 = load i32* %2, align 4
  %65 = sub nsw i32 %63, %64
  %66 = sitofp i32 %65 to double
  %67 = call double @pow(double %66, double 2.000000e+00) #6
  %68 = load i32* %y, align 4
  %69 = load i32* %3, align 4
  %70 = sub nsw i32 %68, %69
  %71 = sitofp i32 %70 to double
  %72 = call double @pow(double %71, double 2.000000e+00) #6
  %73 = fadd double %67, %72
  %74 = call double @sqrt(double %73) #6
  store double %74, double* %distance, align 8
  %75 = load double* %distance, align 8
  %76 = load i32* %8, align 4
  %77 = sitofp i32 %76 to double
  %78 = fcmp olt double %75, %77
  br i1 %78, label %79, label %94

; <label>:79                                      ; preds = %62
  %80 = load i32* %x, align 4
  %81 = load i32* %6, align 4
  %82 = mul nsw i32 %80, %81
  %83 = load i32* %7, align 4
  %84 = mul nsw i32 %82, %83
  %85 = load i32* %y, align 4
  %86 = load i32* %7, align 4
  %87 = mul nsw i32 %85, %86
  %88 = add nsw i32 %84, %87
  %89 = load i32* %4, align 4
  %90 = add nsw i32 %88, %89
  %91 = sext i32 %90 to i64
  %92 = load i32** %1, align 8
  %93 = getelementptr inbounds i32* %92, i64 %91
  store i32 1, i32* %93, align 4
  br label %94

; <label>:94                                      ; preds = %79, %62
  br label %95

; <label>:95                                      ; preds = %94
  %96 = load i32* %y, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %y, align 4
  br label %58

; <label>:98                                      ; preds = %58
  br label %99

; <label>:99                                      ; preds = %98
  %100 = load i32* %x, align 4
  %101 = add nsw i32 %100, 1
  store i32 %101, i32* %x, align 4
  br label %52

; <label>:102                                     ; preds = %52
  ret void
}

; Function Attrs: nounwind uwtable
define void @imdilate_disk(i32* %matrix, i32 %dimX, i32 %dimY, i32 %dimZ, i32 %error, i32* %newMatrix) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  store i32* %matrix, i32** %1, align 8
  store i32 %dimX, i32* %2, align 4
  store i32 %dimY, i32* %3, align 4
  store i32 %dimZ, i32* %4, align 4
  store i32 %error, i32* %5, align 4
  store i32* %newMatrix, i32** %6, align 8
  store i32 0, i32* %z, align 4
  br label %7

; <label>:7                                       ; preds = %56, %0
  %8 = load i32* %z, align 4
  %9 = load i32* %4, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %59

; <label>:11                                      ; preds = %7
  store i32 0, i32* %x, align 4
  br label %12

; <label>:12                                      ; preds = %52, %11
  %13 = load i32* %x, align 4
  %14 = load i32* %2, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %55

; <label>:16                                      ; preds = %12
  store i32 0, i32* %y, align 4
  br label %17

; <label>:17                                      ; preds = %48, %16
  %18 = load i32* %y, align 4
  %19 = load i32* %3, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %51

; <label>:21                                      ; preds = %17
  %22 = load i32* %x, align 4
  %23 = load i32* %3, align 4
  %24 = mul nsw i32 %22, %23
  %25 = load i32* %4, align 4
  %26 = mul nsw i32 %24, %25
  %27 = load i32* %y, align 4
  %28 = load i32* %4, align 4
  %29 = mul nsw i32 %27, %28
  %30 = add nsw i32 %26, %29
  %31 = load i32* %z, align 4
  %32 = add nsw i32 %30, %31
  %33 = sext i32 %32 to i64
  %34 = load i32** %1, align 8
  %35 = getelementptr inbounds i32* %34, i64 %33
  %36 = load i32* %35, align 4
  %37 = icmp eq i32 %36, 1
  br i1 %37, label %38, label %47

; <label>:38                                      ; preds = %21
  %39 = load i32** %6, align 8
  %40 = load i32* %x, align 4
  %41 = load i32* %y, align 4
  %42 = load i32* %z, align 4
  %43 = load i32* %2, align 4
  %44 = load i32* %3, align 4
  %45 = load i32* %4, align 4
  %46 = load i32* %5, align 4
  call void @dilate_matrix(i32* %39, i32 %40, i32 %41, i32 %42, i32 %43, i32 %44, i32 %45, i32 %46)
  br label %47

; <label>:47                                      ; preds = %38, %21
  br label %48

; <label>:48                                      ; preds = %47
  %49 = load i32* %y, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %y, align 4
  br label %17

; <label>:51                                      ; preds = %17
  br label %52

; <label>:52                                      ; preds = %51
  %53 = load i32* %x, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %x, align 4
  br label %12

; <label>:55                                      ; preds = %12
  br label %56

; <label>:56                                      ; preds = %55
  %57 = load i32* %z, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* %z, align 4
  br label %7

; <label>:59                                      ; preds = %7
  ret void
}

; Function Attrs: nounwind uwtable
define void @getneighbors(i32* %se, i32 %numOnes, double* %neighbors, i32 %radius) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %3 = alloca double*, align 8
  %4 = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %neighY = alloca i32, align 4
  %center = alloca i32, align 4
  %diameter = alloca i32, align 4
  store i32* %se, i32** %1, align 8
  store i32 %numOnes, i32* %2, align 4
  store double* %neighbors, double** %3, align 8
  store i32 %radius, i32* %4, align 4
  store i32 0, i32* %neighY, align 4
  %5 = load i32* %4, align 4
  %6 = sub nsw i32 %5, 1
  store i32 %6, i32* %center, align 4
  %7 = load i32* %4, align 4
  %8 = mul nsw i32 %7, 2
  %9 = sub nsw i32 %8, 1
  store i32 %9, i32* %diameter, align 4
  store i32 0, i32* %x, align 4
  br label %10

; <label>:10                                      ; preds = %57, %0
  %11 = load i32* %x, align 4
  %12 = load i32* %diameter, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %60

; <label>:14                                      ; preds = %10
  store i32 0, i32* %y, align 4
  br label %15

; <label>:15                                      ; preds = %53, %14
  %16 = load i32* %y, align 4
  %17 = load i32* %diameter, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %56

; <label>:19                                      ; preds = %15
  %20 = load i32* %x, align 4
  %21 = load i32* %diameter, align 4
  %22 = mul nsw i32 %20, %21
  %23 = load i32* %y, align 4
  %24 = add nsw i32 %22, %23
  %25 = sext i32 %24 to i64
  %26 = load i32** %1, align 8
  %27 = getelementptr inbounds i32* %26, i64 %25
  %28 = load i32* %27, align 4
  %29 = icmp eq i32 %28, 1
  br i1 %29, label %30, label %52

; <label>:30                                      ; preds = %19
  %31 = load i32* %y, align 4
  %32 = load i32* %center, align 4
  %33 = sub nsw i32 %31, %32
  %34 = sitofp i32 %33 to double
  %35 = load i32* %neighY, align 4
  %36 = mul nsw i32 %35, 2
  %37 = sext i32 %36 to i64
  %38 = load double** %3, align 8
  %39 = getelementptr inbounds double* %38, i64 %37
  store double %34, double* %39, align 8
  %40 = load i32* %x, align 4
  %41 = load i32* %center, align 4
  %42 = sub nsw i32 %40, %41
  %43 = sitofp i32 %42 to double
  %44 = load i32* %neighY, align 4
  %45 = mul nsw i32 %44, 2
  %46 = add nsw i32 %45, 1
  %47 = sext i32 %46 to i64
  %48 = load double** %3, align 8
  %49 = getelementptr inbounds double* %48, i64 %47
  store double %43, double* %49, align 8
  %50 = load i32* %neighY, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %neighY, align 4
  br label %52

; <label>:52                                      ; preds = %30, %19
  br label %53

; <label>:53                                      ; preds = %52
  %54 = load i32* %y, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %y, align 4
  br label %15

; <label>:56                                      ; preds = %15
  br label %57

; <label>:57                                      ; preds = %56
  %58 = load i32* %x, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %x, align 4
  br label %10

; <label>:60                                      ; preds = %10
  ret void
}

; Function Attrs: nounwind uwtable
define void @videoSequence(i32* %I, i32 %IszX, i32 %IszY, i32 %Nfr, i32* %seed) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32*, align 8
  %k = alloca i32, align 4
  %max_size = alloca i32, align 4
  %x0 = alloca i32, align 4
  %y0 = alloca i32, align 4
  %xk = alloca i32, align 4
  %yk = alloca i32, align 4
  %pos = alloca i32, align 4
  %newMatrix = alloca i32*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32* %I, i32** %1, align 8
  store i32 %IszX, i32* %2, align 4
  store i32 %IszY, i32* %3, align 4
  store i32 %Nfr, i32* %4, align 4
  store i32* %seed, i32** %5, align 8
  %6 = load i32* %2, align 4
  %7 = load i32* %3, align 4
  %8 = mul nsw i32 %6, %7
  %9 = load i32* %4, align 4
  %10 = mul nsw i32 %8, %9
  store i32 %10, i32* %max_size, align 4
  %11 = load i32* %3, align 4
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 2.000000e+00
  %14 = call double @roundDouble(double %13)
  %15 = fptosi double %14 to i32
  store i32 %15, i32* %x0, align 4
  %16 = load i32* %2, align 4
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 2.000000e+00
  %19 = call double @roundDouble(double %18)
  %20 = fptosi double %19 to i32
  store i32 %20, i32* %y0, align 4
  %21 = load i32* %x0, align 4
  %22 = load i32* %3, align 4
  %23 = mul nsw i32 %21, %22
  %24 = load i32* %4, align 4
  %25 = mul nsw i32 %23, %24
  %26 = load i32* %y0, align 4
  %27 = load i32* %4, align 4
  %28 = mul nsw i32 %26, %27
  %29 = add nsw i32 %25, %28
  %30 = add nsw i32 %29, 0
  %31 = sext i32 %30 to i64
  %32 = load i32** %1, align 8
  %33 = getelementptr inbounds i32* %32, i64 %31
  store i32 1, i32* %33, align 4
  store i32 1, i32* %k, align 4
  br label %34

; <label>:34                                      ; preds = %70, %0
  %35 = load i32* %k, align 4
  %36 = load i32* %4, align 4
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %38, label %73

; <label>:38                                      ; preds = %34
  %39 = load i32* %x0, align 4
  %40 = load i32* %k, align 4
  %41 = sub nsw i32 %40, 1
  %42 = add nsw i32 %39, %41
  %43 = call i32 @abs(i32 %42) #5
  store i32 %43, i32* %xk, align 4
  %44 = load i32* %y0, align 4
  %45 = load i32* %k, align 4
  %46 = sub nsw i32 %45, 1
  %47 = mul nsw i32 2, %46
  %48 = sub nsw i32 %44, %47
  %49 = call i32 @abs(i32 %48) #5
  store i32 %49, i32* %yk, align 4
  %50 = load i32* %yk, align 4
  %51 = load i32* %3, align 4
  %52 = mul nsw i32 %50, %51
  %53 = load i32* %4, align 4
  %54 = mul nsw i32 %52, %53
  %55 = load i32* %xk, align 4
  %56 = load i32* %4, align 4
  %57 = mul nsw i32 %55, %56
  %58 = add nsw i32 %54, %57
  %59 = load i32* %k, align 4
  %60 = add nsw i32 %58, %59
  store i32 %60, i32* %pos, align 4
  %61 = load i32* %pos, align 4
  %62 = load i32* %max_size, align 4
  %63 = icmp sge i32 %61, %62
  br i1 %63, label %64, label %65

; <label>:64                                      ; preds = %38
  store i32 0, i32* %pos, align 4
  br label %65

; <label>:65                                      ; preds = %64, %38
  %66 = load i32* %pos, align 4
  %67 = sext i32 %66 to i64
  %68 = load i32** %1, align 8
  %69 = getelementptr inbounds i32* %68, i64 %67
  store i32 1, i32* %69, align 4
  br label %70

; <label>:70                                      ; preds = %65
  %71 = load i32* %k, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* %k, align 4
  br label %34

; <label>:73                                      ; preds = %34
  %74 = load i32* %2, align 4
  %75 = sext i32 %74 to i64
  %76 = mul i64 4, %75
  %77 = load i32* %3, align 4
  %78 = sext i32 %77 to i64
  %79 = mul i64 %76, %78
  %80 = load i32* %4, align 4
  %81 = sext i32 %80 to i64
  %82 = mul i64 %79, %81
  %83 = call noalias i8* @malloc(i64 %82) #6
  %84 = bitcast i8* %83 to i32*
  store i32* %84, i32** %newMatrix, align 8
  %85 = load i32** %1, align 8
  %86 = load i32* %2, align 4
  %87 = load i32* %3, align 4
  %88 = load i32* %4, align 4
  %89 = load i32** %newMatrix, align 8
  call void @imdilate_disk(i32* %85, i32 %86, i32 %87, i32 %88, i32 5, i32* %89)
  store i32 0, i32* %x, align 4
  br label %90

; <label>:90                                      ; preds = %142, %73
  %91 = load i32* %x, align 4
  %92 = load i32* %2, align 4
  %93 = icmp slt i32 %91, %92
  br i1 %93, label %94, label %145

; <label>:94                                      ; preds = %90
  store i32 0, i32* %y, align 4
  br label %95

; <label>:95                                      ; preds = %138, %94
  %96 = load i32* %y, align 4
  %97 = load i32* %3, align 4
  %98 = icmp slt i32 %96, %97
  br i1 %98, label %99, label %141

; <label>:99                                      ; preds = %95
  store i32 0, i32* %k, align 4
  br label %100

; <label>:100                                     ; preds = %134, %99
  %101 = load i32* %k, align 4
  %102 = load i32* %4, align 4
  %103 = icmp slt i32 %101, %102
  br i1 %103, label %104, label %137

; <label>:104                                     ; preds = %100
  %105 = load i32* %x, align 4
  %106 = load i32* %3, align 4
  %107 = mul nsw i32 %105, %106
  %108 = load i32* %4, align 4
  %109 = mul nsw i32 %107, %108
  %110 = load i32* %y, align 4
  %111 = load i32* %4, align 4
  %112 = mul nsw i32 %110, %111
  %113 = add nsw i32 %109, %112
  %114 = load i32* %k, align 4
  %115 = add nsw i32 %113, %114
  %116 = sext i32 %115 to i64
  %117 = load i32** %newMatrix, align 8
  %118 = getelementptr inbounds i32* %117, i64 %116
  %119 = load i32* %118, align 4
  %120 = load i32* %x, align 4
  %121 = load i32* %3, align 4
  %122 = mul nsw i32 %120, %121
  %123 = load i32* %4, align 4
  %124 = mul nsw i32 %122, %123
  %125 = load i32* %y, align 4
  %126 = load i32* %4, align 4
  %127 = mul nsw i32 %125, %126
  %128 = add nsw i32 %124, %127
  %129 = load i32* %k, align 4
  %130 = add nsw i32 %128, %129
  %131 = sext i32 %130 to i64
  %132 = load i32** %1, align 8
  %133 = getelementptr inbounds i32* %132, i64 %131
  store i32 %119, i32* %133, align 4
  br label %134

; <label>:134                                     ; preds = %104
  %135 = load i32* %k, align 4
  %136 = add nsw i32 %135, 1
  store i32 %136, i32* %k, align 4
  br label %100

; <label>:137                                     ; preds = %100
  br label %138

; <label>:138                                     ; preds = %137
  %139 = load i32* %y, align 4
  %140 = add nsw i32 %139, 1
  store i32 %140, i32* %y, align 4
  br label %95

; <label>:141                                     ; preds = %95
  br label %142

; <label>:142                                     ; preds = %141
  %143 = load i32* %x, align 4
  %144 = add nsw i32 %143, 1
  store i32 %144, i32* %x, align 4
  br label %90

; <label>:145                                     ; preds = %90
  %146 = load i32** %newMatrix, align 8
  %147 = bitcast i32* %146 to i8*
  call void @free(i8* %147) #6
  %148 = load i32** %1, align 8
  call void @setIf(i32 0, i32 100, i32* %148, i32* %2, i32* %3, i32* %4)
  %149 = load i32** %1, align 8
  call void @setIf(i32 1, i32 228, i32* %149, i32* %2, i32* %3, i32* %4)
  %150 = load i32** %1, align 8
  %151 = load i32** %5, align 8
  call void @addNoise(i32* %150, i32* %2, i32* %3, i32* %4, i32* %151)
  ret void
}

; Function Attrs: nounwind readnone
declare i32 @abs(i32) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind uwtable
define double @calcLikelihoodSum(i32* %I, i32* %ind, i32 %numOnes) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %likelihoodSum = alloca double, align 8
  %y = alloca i32, align 4
  store i32* %I, i32** %1, align 8
  store i32* %ind, i32** %2, align 8
  store i32 %numOnes, i32* %3, align 4
  store double 0.000000e+00, double* %likelihoodSum, align 8
  store i32 0, i32* %y, align 4
  br label %4

; <label>:4                                       ; preds = %37, %0
  %5 = load i32* %y, align 4
  %6 = load i32* %3, align 4
  %7 = icmp slt i32 %5, %6
  br i1 %7, label %8, label %40

; <label>:8                                       ; preds = %4
  %9 = load i32* %y, align 4
  %10 = sext i32 %9 to i64
  %11 = load i32** %2, align 8
  %12 = getelementptr inbounds i32* %11, i64 %10
  %13 = load i32* %12, align 4
  %14 = sext i32 %13 to i64
  %15 = load i32** %1, align 8
  %16 = getelementptr inbounds i32* %15, i64 %14
  %17 = load i32* %16, align 4
  %18 = sub nsw i32 %17, 100
  %19 = sitofp i32 %18 to double
  %20 = call double @pow(double %19, double 2.000000e+00) #6
  %21 = load i32* %y, align 4
  %22 = sext i32 %21 to i64
  %23 = load i32** %2, align 8
  %24 = getelementptr inbounds i32* %23, i64 %22
  %25 = load i32* %24, align 4
  %26 = sext i32 %25 to i64
  %27 = load i32** %1, align 8
  %28 = getelementptr inbounds i32* %27, i64 %26
  %29 = load i32* %28, align 4
  %30 = sub nsw i32 %29, 228
  %31 = sitofp i32 %30 to double
  %32 = call double @pow(double %31, double 2.000000e+00) #6
  %33 = fsub double %20, %32
  %34 = fdiv double %33, 5.000000e+01
  %35 = load double* %likelihoodSum, align 8
  %36 = fadd double %35, %34
  store double %36, double* %likelihoodSum, align 8
  br label %37

; <label>:37                                      ; preds = %8
  %38 = load i32* %y, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %y, align 4
  br label %4

; <label>:40                                      ; preds = %4
  %41 = load double* %likelihoodSum, align 8
  ret double %41
}

; Function Attrs: nounwind uwtable
define i32 @findIndex(double* %CDF, i32 %lengthCDF, double %value) #0 {
  %1 = alloca i32, align 4
  %2 = alloca double*, align 8
  %3 = alloca i32, align 4
  %4 = alloca double, align 8
  %index = alloca i32, align 4
  %x = alloca i32, align 4
  store double* %CDF, double** %2, align 8
  store i32 %lengthCDF, i32* %3, align 4
  store double %value, double* %4, align 8
  store i32 -1, i32* %index, align 4
  store i32 0, i32* %x, align 4
  br label %5

; <label>:5                                       ; preds = %20, %0
  %6 = load i32* %x, align 4
  %7 = load i32* %3, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %23

; <label>:9                                       ; preds = %5
  %10 = load i32* %x, align 4
  %11 = sext i32 %10 to i64
  %12 = load double** %2, align 8
  %13 = getelementptr inbounds double* %12, i64 %11
  %14 = load double* %13, align 8
  %15 = load double* %4, align 8
  %16 = fcmp oge double %14, %15
  br i1 %16, label %17, label %19

; <label>:17                                      ; preds = %9
  %18 = load i32* %x, align 4
  store i32 %18, i32* %index, align 4
  br label %23

; <label>:19                                      ; preds = %9
  br label %20

; <label>:20                                      ; preds = %19
  %21 = load i32* %x, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %x, align 4
  br label %5

; <label>:23                                      ; preds = %17, %5
  %24 = load i32* %index, align 4
  %25 = icmp eq i32 %24, -1
  br i1 %25, label %26, label %29

; <label>:26                                      ; preds = %23
  %27 = load i32* %3, align 4
  %28 = sub nsw i32 %27, 1
  store i32 %28, i32* %1
  br label %31

; <label>:29                                      ; preds = %23
  %30 = load i32* %index, align 4
  store i32 %30, i32* %1
  br label %31

; <label>:31                                      ; preds = %29, %26
  %32 = load i32* %1
  ret i32 %32
}

; Function Attrs: nounwind uwtable
define void @particleFilter(i32* %I, i32 %IszX, i32 %IszY, i32 %Nfr, i32* %seed, i32 %Nparticles) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32*, align 8
  %6 = alloca i32, align 4
  %max_size = alloca i32, align 4
  %xe = alloca double, align 8
  %ye = alloca double, align 8
  %radius = alloca i32, align 4
  %diameter = alloca i32, align 4
  %disk = alloca i32*, align 8
  %countOnes = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %forLoopCount = alloca i32, align 4
  %objxy = alloca double*, align 8
  %weights = alloca double*, align 8
  %likelihood = alloca double*, align 8
  %arrayX = alloca double*, align 8
  %arrayY = alloca double*, align 8
  %xj = alloca double*, align 8
  %yj = alloca double*, align 8
  %CDF = alloca double*, align 8
  %u = alloca double*, align 8
  %ind = alloca i32*, align 8
  %k = alloca i32, align 4
  %indX = alloca i32, align 4
  %indY = alloca i32, align 4
  %fpo = alloca %struct._IO_FILE*, align 8
  %sumWeights = alloca double, align 8
  %distance = alloca double, align 8
  %u1 = alloca double, align 8
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %I, i32** %1, align 8
  store i32 %IszX, i32* %2, align 4
  store i32 %IszY, i32* %3, align 4
  store i32 %Nfr, i32* %4, align 4
  store i32* %seed, i32** %5, align 8
  store i32 %Nparticles, i32* %6, align 4
  %7 = load i32* %2, align 4
  %8 = load i32* %3, align 4
  %9 = mul nsw i32 %7, %8
  %10 = load i32* %4, align 4
  %11 = mul nsw i32 %9, %10
  store i32 %11, i32* %max_size, align 4
  %12 = load i32* %3, align 4
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.000000e+00
  %15 = call double @roundDouble(double %14)
  store double %15, double* %xe, align 8
  %16 = load i32* %2, align 4
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 2.000000e+00
  %19 = call double @roundDouble(double %18)
  store double %19, double* %ye, align 8
  store i32 5, i32* %radius, align 4
  %20 = load i32* %radius, align 4
  %21 = mul nsw i32 %20, 2
  %22 = sub nsw i32 %21, 1
  store i32 %22, i32* %diameter, align 4
  %23 = load i32* %diameter, align 4
  %24 = load i32* %diameter, align 4
  %25 = mul nsw i32 %23, %24
  %26 = sext i32 %25 to i64
  %27 = mul i64 %26, 4
  %28 = call noalias i8* @malloc(i64 %27) #6
  %29 = bitcast i8* %28 to i32*
  store i32* %29, i32** %disk, align 8
  %30 = load i32** %disk, align 8
  %31 = load i32* %radius, align 4
  call void @strelDisk(i32* %30, i32 %31)
  store i32 0, i32* %countOnes, align 4
  store i32 0, i32* %forLoopCount, align 4
  store i32 0, i32* %x, align 4
  br label %32

; <label>:32                                      ; preds = %62, %0
  %33 = load i32* %x, align 4
  %34 = load i32* %diameter, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %65

; <label>:36                                      ; preds = %32
  store i32 0, i32* %y, align 4
  br label %37

; <label>:37                                      ; preds = %58, %36
  %38 = load i32* %y, align 4
  %39 = load i32* %diameter, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %61

; <label>:41                                      ; preds = %37
  %42 = load i32* %forLoopCount, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %forLoopCount, align 4
  %44 = load i32* %x, align 4
  %45 = load i32* %diameter, align 4
  %46 = mul nsw i32 %44, %45
  %47 = load i32* %y, align 4
  %48 = add nsw i32 %46, %47
  %49 = sext i32 %48 to i64
  %50 = load i32** %disk, align 8
  %51 = getelementptr inbounds i32* %50, i64 %49
  %52 = load i32* %51, align 4
  %53 = icmp eq i32 %52, 1
  br i1 %53, label %54, label %57

; <label>:54                                      ; preds = %41
  %55 = load i32* %countOnes, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %countOnes, align 4
  br label %57

; <label>:57                                      ; preds = %54, %41
  br label %58

; <label>:58                                      ; preds = %57
  %59 = load i32* %y, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %y, align 4
  br label %37

; <label>:61                                      ; preds = %37
  br label %62

; <label>:62                                      ; preds = %61
  %63 = load i32* %x, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %x, align 4
  br label %32

; <label>:65                                      ; preds = %32
  %66 = load i32* %countOnes, align 4
  %67 = mul nsw i32 %66, 2
  %68 = sext i32 %67 to i64
  %69 = mul i64 %68, 8
  %70 = call noalias i8* @malloc(i64 %69) #6
  %71 = bitcast i8* %70 to double*
  store double* %71, double** %objxy, align 8
  %72 = load i32** %disk, align 8
  %73 = load i32* %countOnes, align 4
  %74 = load double** %objxy, align 8
  %75 = load i32* %radius, align 4
  call void @getneighbors(i32* %72, i32 %73, double* %74, i32 %75)
  %76 = load i32* %6, align 4
  %77 = sext i32 %76 to i64
  %78 = mul i64 8, %77
  %79 = call noalias i8* @malloc(i64 %78) #6
  %80 = bitcast i8* %79 to double*
  store double* %80, double** %weights, align 8
  store i32 0, i32* %x, align 4
  br label %81

; <label>:81                                      ; preds = %93, %65
  %82 = load i32* %x, align 4
  %83 = load i32* %6, align 4
  %84 = icmp slt i32 %82, %83
  br i1 %84, label %85, label %96

; <label>:85                                      ; preds = %81
  %86 = load i32* %6, align 4
  %87 = sitofp i32 %86 to double
  %88 = fdiv double 1.000000e+00, %87
  %89 = load i32* %x, align 4
  %90 = sext i32 %89 to i64
  %91 = load double** %weights, align 8
  %92 = getelementptr inbounds double* %91, i64 %90
  store double %88, double* %92, align 8
  br label %93

; <label>:93                                      ; preds = %85
  %94 = load i32* %x, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, i32* %x, align 4
  br label %81

; <label>:96                                      ; preds = %81
  %97 = load i32* %6, align 4
  %98 = sext i32 %97 to i64
  %99 = mul i64 8, %98
  %100 = call noalias i8* @malloc(i64 %99) #6
  %101 = bitcast i8* %100 to double*
  store double* %101, double** %likelihood, align 8
  %102 = load i32* %6, align 4
  %103 = sext i32 %102 to i64
  %104 = mul i64 8, %103
  %105 = call noalias i8* @malloc(i64 %104) #6
  %106 = bitcast i8* %105 to double*
  store double* %106, double** %arrayX, align 8
  %107 = load i32* %6, align 4
  %108 = sext i32 %107 to i64
  %109 = mul i64 8, %108
  %110 = call noalias i8* @malloc(i64 %109) #6
  %111 = bitcast i8* %110 to double*
  store double* %111, double** %arrayY, align 8
  %112 = load i32* %6, align 4
  %113 = sext i32 %112 to i64
  %114 = mul i64 8, %113
  %115 = call noalias i8* @malloc(i64 %114) #6
  %116 = bitcast i8* %115 to double*
  store double* %116, double** %xj, align 8
  %117 = load i32* %6, align 4
  %118 = sext i32 %117 to i64
  %119 = mul i64 8, %118
  %120 = call noalias i8* @malloc(i64 %119) #6
  %121 = bitcast i8* %120 to double*
  store double* %121, double** %yj, align 8
  %122 = load i32* %6, align 4
  %123 = sext i32 %122 to i64
  %124 = mul i64 8, %123
  %125 = call noalias i8* @malloc(i64 %124) #6
  %126 = bitcast i8* %125 to double*
  store double* %126, double** %CDF, align 8
  %127 = load i32* %6, align 4
  %128 = sext i32 %127 to i64
  %129 = mul i64 8, %128
  %130 = call noalias i8* @malloc(i64 %129) #6
  %131 = bitcast i8* %130 to double*
  store double* %131, double** %u, align 8
  %132 = load i32* %countOnes, align 4
  %133 = sext i32 %132 to i64
  %134 = mul i64 4, %133
  %135 = load i32* %6, align 4
  %136 = sext i32 %135 to i64
  %137 = mul i64 %134, %136
  %138 = call noalias i8* @malloc(i64 %137) #6
  %139 = bitcast i8* %138 to i32*
  store i32* %139, i32** %ind, align 8
  store i32 0, i32* %x, align 4
  br label %140

; <label>:140                                     ; preds = %155, %96
  %141 = load i32* %x, align 4
  %142 = load i32* %6, align 4
  %143 = icmp slt i32 %141, %142
  br i1 %143, label %144, label %158

; <label>:144                                     ; preds = %140
  %145 = load double* %xe, align 8
  %146 = load i32* %x, align 4
  %147 = sext i32 %146 to i64
  %148 = load double** %arrayX, align 8
  %149 = getelementptr inbounds double* %148, i64 %147
  store double %145, double* %149, align 8
  %150 = load double* %ye, align 8
  %151 = load i32* %x, align 4
  %152 = sext i32 %151 to i64
  %153 = load double** %arrayY, align 8
  %154 = getelementptr inbounds double* %153, i64 %152
  store double %150, double* %154, align 8
  br label %155

; <label>:155                                     ; preds = %144
  %156 = load i32* %x, align 4
  %157 = add nsw i32 %156, 1
  store i32 %157, i32* %x, align 4
  br label %140

; <label>:158                                     ; preds = %140
  %159 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  store %struct._IO_FILE* %159, %struct._IO_FILE** %fpo, align 8
  store i32 1, i32* %k, align 4
  br label %160

; <label>:160                                     ; preds = %630, %158
  %161 = load i32* %k, align 4
  %162 = load i32* %4, align 4
  %163 = icmp slt i32 %161, %162
  br i1 %163, label %164, label %633

; <label>:164                                     ; preds = %160
  store i32 0, i32* %x, align 4
  br label %165

; <label>:165                                     ; preds = %192, %164
  %166 = load i32* %x, align 4
  %167 = load i32* %6, align 4
  %168 = icmp slt i32 %166, %167
  br i1 %168, label %169, label %195

; <label>:169                                     ; preds = %165
  %170 = load i32** %5, align 8
  %171 = load i32* %x, align 4
  %172 = call double @randu(i32* %170, i32 %171)
  %173 = fmul double 5.000000e+00, %172
  %174 = fadd double 1.000000e+00, %173
  %175 = load i32* %x, align 4
  %176 = sext i32 %175 to i64
  %177 = load double** %arrayX, align 8
  %178 = getelementptr inbounds double* %177, i64 %176
  %179 = load double* %178, align 8
  %180 = fadd double %179, %174
  store double %180, double* %178, align 8
  %181 = load i32** %5, align 8
  %182 = load i32* %x, align 4
  %183 = call double @randu(i32* %181, i32 %182)
  %184 = fmul double 2.000000e+00, %183
  %185 = fadd double -2.000000e+00, %184
  %186 = load i32* %x, align 4
  %187 = sext i32 %186 to i64
  %188 = load double** %arrayY, align 8
  %189 = getelementptr inbounds double* %188, i64 %187
  %190 = load double* %189, align 8
  %191 = fadd double %190, %185
  store double %191, double* %189, align 8
  br label %192

; <label>:192                                     ; preds = %169
  %193 = load i32* %x, align 4
  %194 = add nsw i32 %193, 1
  store i32 %194, i32* %x, align 4
  br label %165

; <label>:195                                     ; preds = %165
  store i32 0, i32* %x, align 4
  br label %196

; <label>:196                                     ; preds = %347, %195
  %197 = load i32* %x, align 4
  %198 = load i32* %6, align 4
  %199 = icmp slt i32 %197, %198
  br i1 %199, label %200, label %350

; <label>:200                                     ; preds = %196
  store i32 0, i32* %y, align 4
  br label %201

; <label>:201                                     ; preds = %278, %200
  %202 = load i32* %y, align 4
  %203 = load i32* %countOnes, align 4
  %204 = icmp slt i32 %202, %203
  br i1 %204, label %205, label %281

; <label>:205                                     ; preds = %201
  %206 = load i32* %x, align 4
  %207 = sext i32 %206 to i64
  %208 = load double** %arrayX, align 8
  %209 = getelementptr inbounds double* %208, i64 %207
  %210 = load double* %209, align 8
  %211 = call double @roundDouble(double %210)
  %212 = load i32* %y, align 4
  %213 = mul nsw i32 %212, 2
  %214 = add nsw i32 %213, 1
  %215 = sext i32 %214 to i64
  %216 = load double** %objxy, align 8
  %217 = getelementptr inbounds double* %216, i64 %215
  %218 = load double* %217, align 8
  %219 = fadd double %211, %218
  %220 = fptosi double %219 to i32
  store i32 %220, i32* %indX, align 4
  %221 = load i32* %x, align 4
  %222 = sext i32 %221 to i64
  %223 = load double** %arrayY, align 8
  %224 = getelementptr inbounds double* %223, i64 %222
  %225 = load double* %224, align 8
  %226 = call double @roundDouble(double %225)
  %227 = load i32* %y, align 4
  %228 = mul nsw i32 %227, 2
  %229 = sext i32 %228 to i64
  %230 = load double** %objxy, align 8
  %231 = getelementptr inbounds double* %230, i64 %229
  %232 = load double* %231, align 8
  %233 = fadd double %226, %232
  %234 = fptosi double %233 to i32
  store i32 %234, i32* %indY, align 4
  %235 = load i32* %indX, align 4
  %236 = load i32* %3, align 4
  %237 = mul nsw i32 %235, %236
  %238 = load i32* %4, align 4
  %239 = mul nsw i32 %237, %238
  %240 = load i32* %indY, align 4
  %241 = load i32* %4, align 4
  %242 = mul nsw i32 %240, %241
  %243 = add nsw i32 %239, %242
  %244 = load i32* %k, align 4
  %245 = add nsw i32 %243, %244
  %246 = sitofp i32 %245 to double
  %247 = call double @fabs(double %246) #5
  %248 = fptosi double %247 to i32
  %249 = load i32* %x, align 4
  %250 = load i32* %countOnes, align 4
  %251 = mul nsw i32 %249, %250
  %252 = load i32* %y, align 4
  %253 = add nsw i32 %251, %252
  %254 = sext i32 %253 to i64
  %255 = load i32** %ind, align 8
  %256 = getelementptr inbounds i32* %255, i64 %254
  store i32 %248, i32* %256, align 4
  %257 = load i32* %x, align 4
  %258 = load i32* %countOnes, align 4
  %259 = mul nsw i32 %257, %258
  %260 = load i32* %y, align 4
  %261 = add nsw i32 %259, %260
  %262 = sext i32 %261 to i64
  %263 = load i32** %ind, align 8
  %264 = getelementptr inbounds i32* %263, i64 %262
  %265 = load i32* %264, align 4
  %266 = load i32* %max_size, align 4
  %267 = icmp sge i32 %265, %266
  br i1 %267, label %268, label %277

; <label>:268                                     ; preds = %205
  %269 = load i32* %x, align 4
  %270 = load i32* %countOnes, align 4
  %271 = mul nsw i32 %269, %270
  %272 = load i32* %y, align 4
  %273 = add nsw i32 %271, %272
  %274 = sext i32 %273 to i64
  %275 = load i32** %ind, align 8
  %276 = getelementptr inbounds i32* %275, i64 %274
  store i32 0, i32* %276, align 4
  br label %277

; <label>:277                                     ; preds = %268, %205
  br label %278

; <label>:278                                     ; preds = %277
  %279 = load i32* %y, align 4
  %280 = add nsw i32 %279, 1
  store i32 %280, i32* %y, align 4
  br label %201

; <label>:281                                     ; preds = %201
  %282 = load i32* %x, align 4
  %283 = sext i32 %282 to i64
  %284 = load double** %likelihood, align 8
  %285 = getelementptr inbounds double* %284, i64 %283
  store double 0.000000e+00, double* %285, align 8
  store i32 0, i32* %y, align 4
  br label %286

; <label>:286                                     ; preds = %331, %281
  %287 = load i32* %y, align 4
  %288 = load i32* %countOnes, align 4
  %289 = icmp slt i32 %287, %288
  br i1 %289, label %290, label %334

; <label>:290                                     ; preds = %286
  %291 = load i32* %x, align 4
  %292 = load i32* %countOnes, align 4
  %293 = mul nsw i32 %291, %292
  %294 = load i32* %y, align 4
  %295 = add nsw i32 %293, %294
  %296 = sext i32 %295 to i64
  %297 = load i32** %ind, align 8
  %298 = getelementptr inbounds i32* %297, i64 %296
  %299 = load i32* %298, align 4
  %300 = sext i32 %299 to i64
  %301 = load i32** %1, align 8
  %302 = getelementptr inbounds i32* %301, i64 %300
  %303 = load i32* %302, align 4
  %304 = sub nsw i32 %303, 100
  %305 = sitofp i32 %304 to double
  %306 = call double @pow(double %305, double 2.000000e+00) #6
  %307 = load i32* %x, align 4
  %308 = load i32* %countOnes, align 4
  %309 = mul nsw i32 %307, %308
  %310 = load i32* %y, align 4
  %311 = add nsw i32 %309, %310
  %312 = sext i32 %311 to i64
  %313 = load i32** %ind, align 8
  %314 = getelementptr inbounds i32* %313, i64 %312
  %315 = load i32* %314, align 4
  %316 = sext i32 %315 to i64
  %317 = load i32** %1, align 8
  %318 = getelementptr inbounds i32* %317, i64 %316
  %319 = load i32* %318, align 4
  %320 = sub nsw i32 %319, 228
  %321 = sitofp i32 %320 to double
  %322 = call double @pow(double %321, double 2.000000e+00) #6
  %323 = fsub double %306, %322
  %324 = fdiv double %323, 5.000000e+01
  %325 = load i32* %x, align 4
  %326 = sext i32 %325 to i64
  %327 = load double** %likelihood, align 8
  %328 = getelementptr inbounds double* %327, i64 %326
  %329 = load double* %328, align 8
  %330 = fadd double %329, %324
  store double %330, double* %328, align 8
  br label %331

; <label>:331                                     ; preds = %290
  %332 = load i32* %y, align 4
  %333 = add nsw i32 %332, 1
  store i32 %333, i32* %y, align 4
  br label %286

; <label>:334                                     ; preds = %286
  %335 = load i32* %x, align 4
  %336 = sext i32 %335 to i64
  %337 = load double** %likelihood, align 8
  %338 = getelementptr inbounds double* %337, i64 %336
  %339 = load double* %338, align 8
  %340 = load i32* %countOnes, align 4
  %341 = sitofp i32 %340 to double
  %342 = fdiv double %339, %341
  %343 = load i32* %x, align 4
  %344 = sext i32 %343 to i64
  %345 = load double** %likelihood, align 8
  %346 = getelementptr inbounds double* %345, i64 %344
  store double %342, double* %346, align 8
  br label %347

; <label>:347                                     ; preds = %334
  %348 = load i32* %x, align 4
  %349 = add nsw i32 %348, 1
  store i32 %349, i32* %x, align 4
  br label %196

; <label>:350                                     ; preds = %196
  store i32 0, i32* %x, align 4
  br label %351

; <label>:351                                     ; preds = %395, %350
  %352 = load i32* %x, align 4
  %353 = load i32* %6, align 4
  %354 = icmp slt i32 %352, %353
  br i1 %354, label %355, label %398

; <label>:355                                     ; preds = %351
  %356 = load i32* %x, align 4
  %357 = sext i32 %356 to i64
  %358 = load double** %likelihood, align 8
  %359 = getelementptr inbounds double* %358, i64 %357
  %360 = load double* %359, align 8
  %361 = fcmp ogt double %360, 7.000000e+02
  br i1 %361, label %362, label %367

; <label>:362                                     ; preds = %355
  %363 = load i32* %x, align 4
  %364 = sext i32 %363 to i64
  %365 = load double** %likelihood, align 8
  %366 = getelementptr inbounds double* %365, i64 %364
  store double 7.000000e+02, double* %366, align 8
  br label %373

; <label>:367                                     ; preds = %355
  %368 = load i32* %x, align 4
  %369 = sext i32 %368 to i64
  %370 = load double** %likelihood, align 8
  %371 = getelementptr inbounds double* %370, i64 %369
  %372 = load double* %371, align 8
  br label %373

; <label>:373                                     ; preds = %367, %362
  %374 = phi double [ 7.000000e+02, %362 ], [ %372, %367 ]
  %375 = load i32* %x, align 4
  %376 = sext i32 %375 to i64
  %377 = load double** %likelihood, align 8
  %378 = getelementptr inbounds double* %377, i64 %376
  store double %374, double* %378, align 8
  %379 = load i32* %x, align 4
  %380 = sext i32 %379 to i64
  %381 = load double** %weights, align 8
  %382 = getelementptr inbounds double* %381, i64 %380
  %383 = load double* %382, align 8
  %384 = load i32* %x, align 4
  %385 = sext i32 %384 to i64
  %386 = load double** %likelihood, align 8
  %387 = getelementptr inbounds double* %386, i64 %385
  %388 = load double* %387, align 8
  %389 = call double @exp(double %388) #6
  %390 = fmul double %383, %389
  %391 = load i32* %x, align 4
  %392 = sext i32 %391 to i64
  %393 = load double** %weights, align 8
  %394 = getelementptr inbounds double* %393, i64 %392
  store double %390, double* %394, align 8
  br label %395

; <label>:395                                     ; preds = %373
  %396 = load i32* %x, align 4
  %397 = add nsw i32 %396, 1
  store i32 %397, i32* %x, align 4
  br label %351

; <label>:398                                     ; preds = %351
  store double 0.000000e+00, double* %sumWeights, align 8
  store i32 0, i32* %x, align 4
  br label %399

; <label>:399                                     ; preds = %411, %398
  %400 = load i32* %x, align 4
  %401 = load i32* %6, align 4
  %402 = icmp slt i32 %400, %401
  br i1 %402, label %403, label %414

; <label>:403                                     ; preds = %399
  %404 = load i32* %x, align 4
  %405 = sext i32 %404 to i64
  %406 = load double** %weights, align 8
  %407 = getelementptr inbounds double* %406, i64 %405
  %408 = load double* %407, align 8
  %409 = load double* %sumWeights, align 8
  %410 = fadd double %409, %408
  store double %410, double* %sumWeights, align 8
  br label %411

; <label>:411                                     ; preds = %403
  %412 = load i32* %x, align 4
  %413 = add nsw i32 %412, 1
  store i32 %413, i32* %x, align 4
  br label %399

; <label>:414                                     ; preds = %399
  store i32 0, i32* %x, align 4
  br label %415

; <label>:415                                     ; preds = %431, %414
  %416 = load i32* %x, align 4
  %417 = load i32* %6, align 4
  %418 = icmp slt i32 %416, %417
  br i1 %418, label %419, label %434

; <label>:419                                     ; preds = %415
  %420 = load i32* %x, align 4
  %421 = sext i32 %420 to i64
  %422 = load double** %weights, align 8
  %423 = getelementptr inbounds double* %422, i64 %421
  %424 = load double* %423, align 8
  %425 = load double* %sumWeights, align 8
  %426 = fdiv double %424, %425
  %427 = load i32* %x, align 4
  %428 = sext i32 %427 to i64
  %429 = load double** %weights, align 8
  %430 = getelementptr inbounds double* %429, i64 %428
  store double %426, double* %430, align 8
  br label %431

; <label>:431                                     ; preds = %419
  %432 = load i32* %x, align 4
  %433 = add nsw i32 %432, 1
  store i32 %433, i32* %x, align 4
  br label %415

; <label>:434                                     ; preds = %415
  store double 0.000000e+00, double* %xe, align 8
  store double 0.000000e+00, double* %ye, align 8
  store i32 0, i32* %x, align 4
  br label %435

; <label>:435                                     ; preds = %466, %434
  %436 = load i32* %x, align 4
  %437 = load i32* %6, align 4
  %438 = icmp slt i32 %436, %437
  br i1 %438, label %439, label %469

; <label>:439                                     ; preds = %435
  %440 = load i32* %x, align 4
  %441 = sext i32 %440 to i64
  %442 = load double** %arrayX, align 8
  %443 = getelementptr inbounds double* %442, i64 %441
  %444 = load double* %443, align 8
  %445 = load i32* %x, align 4
  %446 = sext i32 %445 to i64
  %447 = load double** %weights, align 8
  %448 = getelementptr inbounds double* %447, i64 %446
  %449 = load double* %448, align 8
  %450 = fmul double %444, %449
  %451 = load double* %xe, align 8
  %452 = fadd double %451, %450
  store double %452, double* %xe, align 8
  %453 = load i32* %x, align 4
  %454 = sext i32 %453 to i64
  %455 = load double** %arrayY, align 8
  %456 = getelementptr inbounds double* %455, i64 %454
  %457 = load double* %456, align 8
  %458 = load i32* %x, align 4
  %459 = sext i32 %458 to i64
  %460 = load double** %weights, align 8
  %461 = getelementptr inbounds double* %460, i64 %459
  %462 = load double* %461, align 8
  %463 = fmul double %457, %462
  %464 = load double* %ye, align 8
  %465 = fadd double %464, %463
  store double %465, double* %ye, align 8
  br label %466

; <label>:466                                     ; preds = %439
  %467 = load i32* %x, align 4
  %468 = add nsw i32 %467, 1
  store i32 %468, i32* %x, align 4
  br label %435

; <label>:469                                     ; preds = %435
  %470 = load %struct._IO_FILE** %fpo, align 8
  %471 = load double* %xe, align 8
  %472 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %470, i8* getelementptr inbounds ([11 x i8]* @.str2, i32 0, i32 0), double %471)
  %473 = load %struct._IO_FILE** %fpo, align 8
  %474 = load double* %ye, align 8
  %475 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %473, i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), double %474)
  %476 = load double* %xe, align 8
  %477 = load i32* %3, align 4
  %478 = sitofp i32 %477 to double
  %479 = fdiv double %478, 2.000000e+00
  %480 = call double @roundDouble(double %479)
  %481 = fptosi double %480 to i32
  %482 = sitofp i32 %481 to double
  %483 = fsub double %476, %482
  %484 = call double @pow(double %483, double 2.000000e+00) #6
  %485 = load double* %ye, align 8
  %486 = load i32* %2, align 4
  %487 = sitofp i32 %486 to double
  %488 = fdiv double %487, 2.000000e+00
  %489 = call double @roundDouble(double %488)
  %490 = fptosi double %489 to i32
  %491 = sitofp i32 %490 to double
  %492 = fsub double %485, %491
  %493 = call double @pow(double %492, double 2.000000e+00) #6
  %494 = fadd double %484, %493
  %495 = call double @sqrt(double %494) #6
  store double %495, double* %distance, align 8
  %496 = load %struct._IO_FILE** %fpo, align 8
  %497 = load double* %distance, align 8
  %498 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %496, i8* getelementptr inbounds ([17 x i8]* @.str4, i32 0, i32 0), double %497)
  %499 = load double** %weights, align 8
  %500 = getelementptr inbounds double* %499, i64 0
  %501 = load double* %500, align 8
  %502 = load double** %CDF, align 8
  %503 = getelementptr inbounds double* %502, i64 0
  store double %501, double* %503, align 8
  store i32 1, i32* %x, align 4
  br label %504

; <label>:504                                     ; preds = %525, %469
  %505 = load i32* %x, align 4
  %506 = load i32* %6, align 4
  %507 = icmp slt i32 %505, %506
  br i1 %507, label %508, label %528

; <label>:508                                     ; preds = %504
  %509 = load i32* %x, align 4
  %510 = sext i32 %509 to i64
  %511 = load double** %weights, align 8
  %512 = getelementptr inbounds double* %511, i64 %510
  %513 = load double* %512, align 8
  %514 = load i32* %x, align 4
  %515 = sub nsw i32 %514, 1
  %516 = sext i32 %515 to i64
  %517 = load double** %CDF, align 8
  %518 = getelementptr inbounds double* %517, i64 %516
  %519 = load double* %518, align 8
  %520 = fadd double %513, %519
  %521 = load i32* %x, align 4
  %522 = sext i32 %521 to i64
  %523 = load double** %CDF, align 8
  %524 = getelementptr inbounds double* %523, i64 %522
  store double %520, double* %524, align 8
  br label %525

; <label>:525                                     ; preds = %508
  %526 = load i32* %x, align 4
  %527 = add nsw i32 %526, 1
  store i32 %527, i32* %x, align 4
  br label %504

; <label>:528                                     ; preds = %504
  %529 = load i32* %6, align 4
  %530 = sitofp i32 %529 to double
  %531 = fdiv double 1.000000e+00, %530
  %532 = load i32** %5, align 8
  %533 = call double @randu(i32* %532, i32 0)
  %534 = fmul double %531, %533
  store double %534, double* %u1, align 8
  store i32 0, i32* %x, align 4
  br label %535

; <label>:535                                     ; preds = %551, %528
  %536 = load i32* %x, align 4
  %537 = load i32* %6, align 4
  %538 = icmp slt i32 %536, %537
  br i1 %538, label %539, label %554

; <label>:539                                     ; preds = %535
  %540 = load double* %u1, align 8
  %541 = load i32* %x, align 4
  %542 = sitofp i32 %541 to double
  %543 = load i32* %6, align 4
  %544 = sitofp i32 %543 to double
  %545 = fdiv double %542, %544
  %546 = fadd double %540, %545
  %547 = load i32* %x, align 4
  %548 = sext i32 %547 to i64
  %549 = load double** %u, align 8
  %550 = getelementptr inbounds double* %549, i64 %548
  store double %546, double* %550, align 8
  br label %551

; <label>:551                                     ; preds = %539
  %552 = load i32* %x, align 4
  %553 = add nsw i32 %552, 1
  store i32 %553, i32* %x, align 4
  br label %535

; <label>:554                                     ; preds = %535
  store i32 0, i32* %j, align 4
  br label %555

; <label>:555                                     ; preds = %592, %554
  %556 = load i32* %j, align 4
  %557 = load i32* %6, align 4
  %558 = icmp slt i32 %556, %557
  br i1 %558, label %559, label %595

; <label>:559                                     ; preds = %555
  %560 = load double** %CDF, align 8
  %561 = load i32* %6, align 4
  %562 = load i32* %j, align 4
  %563 = sext i32 %562 to i64
  %564 = load double** %u, align 8
  %565 = getelementptr inbounds double* %564, i64 %563
  %566 = load double* %565, align 8
  %567 = call i32 @findIndex(double* %560, i32 %561, double %566)
  store i32 %567, i32* %i, align 4
  %568 = load i32* %i, align 4
  %569 = icmp eq i32 %568, -1
  br i1 %569, label %570, label %573

; <label>:570                                     ; preds = %559
  %571 = load i32* %6, align 4
  %572 = sub nsw i32 %571, 1
  store i32 %572, i32* %i, align 4
  br label %573

; <label>:573                                     ; preds = %570, %559
  %574 = load i32* %i, align 4
  %575 = sext i32 %574 to i64
  %576 = load double** %arrayX, align 8
  %577 = getelementptr inbounds double* %576, i64 %575
  %578 = load double* %577, align 8
  %579 = load i32* %j, align 4
  %580 = sext i32 %579 to i64
  %581 = load double** %xj, align 8
  %582 = getelementptr inbounds double* %581, i64 %580
  store double %578, double* %582, align 8
  %583 = load i32* %i, align 4
  %584 = sext i32 %583 to i64
  %585 = load double** %arrayY, align 8
  %586 = getelementptr inbounds double* %585, i64 %584
  %587 = load double* %586, align 8
  %588 = load i32* %j, align 4
  %589 = sext i32 %588 to i64
  %590 = load double** %yj, align 8
  %591 = getelementptr inbounds double* %590, i64 %589
  store double %587, double* %591, align 8
  br label %592

; <label>:592                                     ; preds = %573
  %593 = load i32* %j, align 4
  %594 = add nsw i32 %593, 1
  store i32 %594, i32* %j, align 4
  br label %555

; <label>:595                                     ; preds = %555
  store i32 0, i32* %x, align 4
  br label %596

; <label>:596                                     ; preds = %626, %595
  %597 = load i32* %x, align 4
  %598 = load i32* %6, align 4
  %599 = icmp slt i32 %597, %598
  br i1 %599, label %600, label %629

; <label>:600                                     ; preds = %596
  %601 = load i32* %x, align 4
  %602 = sext i32 %601 to i64
  %603 = load double** %xj, align 8
  %604 = getelementptr inbounds double* %603, i64 %602
  %605 = load double* %604, align 8
  %606 = load i32* %x, align 4
  %607 = sext i32 %606 to i64
  %608 = load double** %arrayX, align 8
  %609 = getelementptr inbounds double* %608, i64 %607
  store double %605, double* %609, align 8
  %610 = load i32* %x, align 4
  %611 = sext i32 %610 to i64
  %612 = load double** %yj, align 8
  %613 = getelementptr inbounds double* %612, i64 %611
  %614 = load double* %613, align 8
  %615 = load i32* %x, align 4
  %616 = sext i32 %615 to i64
  %617 = load double** %arrayY, align 8
  %618 = getelementptr inbounds double* %617, i64 %616
  store double %614, double* %618, align 8
  %619 = load i32* %6, align 4
  %620 = sitofp i32 %619 to double
  %621 = fdiv double 1.000000e+00, %620
  %622 = load i32* %x, align 4
  %623 = sext i32 %622 to i64
  %624 = load double** %weights, align 8
  %625 = getelementptr inbounds double* %624, i64 %623
  store double %621, double* %625, align 8
  br label %626

; <label>:626                                     ; preds = %600
  %627 = load i32* %x, align 4
  %628 = add nsw i32 %627, 1
  store i32 %628, i32* %x, align 4
  br label %596

; <label>:629                                     ; preds = %596
  br label %630

; <label>:630                                     ; preds = %629
  %631 = load i32* %k, align 4
  %632 = add nsw i32 %631, 1
  store i32 %632, i32* %k, align 4
  br label %160

; <label>:633                                     ; preds = %160
  %634 = load %struct._IO_FILE** %fpo, align 8
  %635 = call i32 @fclose(%struct._IO_FILE* %634)
  %636 = load i32** %disk, align 8
  %637 = bitcast i32* %636 to i8*
  call void @free(i8* %637) #6
  %638 = load double** %objxy, align 8
  %639 = bitcast double* %638 to i8*
  call void @free(i8* %639) #6
  %640 = load double** %weights, align 8
  %641 = bitcast double* %640 to i8*
  call void @free(i8* %641) #6
  %642 = load double** %likelihood, align 8
  %643 = bitcast double* %642 to i8*
  call void @free(i8* %643) #6
  %644 = load double** %xj, align 8
  %645 = bitcast double* %644 to i8*
  call void @free(i8* %645) #6
  %646 = load double** %yj, align 8
  %647 = bitcast double* %646 to i8*
  call void @free(i8* %647) #6
  %648 = load double** %arrayX, align 8
  %649 = bitcast double* %648 to i8*
  call void @free(i8* %649) #6
  %650 = load double** %arrayY, align 8
  %651 = bitcast double* %650 to i8*
  call void @free(i8* %651) #6
  %652 = load double** %CDF, align 8
  %653 = bitcast double* %652 to i8*
  call void @free(i8* %653) #6
  %654 = load double** %u, align 8
  %655 = bitcast double* %654 to i8*
  call void @free(i8* %655) #6
  %656 = load i32** %ind, align 8
  %657 = bitcast i32* %656 to i8*
  call void @free(i8* %657) #6
  ret void
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #3

; Function Attrs: nounwind
declare double @exp(double) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

declare i32 @fclose(%struct._IO_FILE*) #3

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %usage = alloca i8*, align 8
  %IszX = alloca i32, align 4
  %IszY = alloca i32, align 4
  %Nfr = alloca i32, align 4
  %Nparticles = alloca i32, align 4
  %seed = alloca i32*, align 8
  %i = alloca i32, align 4
  %I = alloca i32*, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i8* getelementptr inbounds ([57 x i8]* @.str5, i32 0, i32 0), i8** %usage, align 8
  %4 = load i32* %2, align 4
  %5 = icmp ne i32 %4, 9
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i8** %usage, align 8
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str6, i32 0, i32 0), i8* %7)
  store i32 0, i32* %1
  br label %134

; <label>:9                                       ; preds = %0
  %10 = load i8*** %3, align 8
  %11 = getelementptr inbounds i8** %10, i64 1
  %12 = load i8** %11, align 8
  %13 = call i32 @strcmp(i8* %12, i8* getelementptr inbounds ([3 x i8]* @.str7, i32 0, i32 0)) #7
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %33, label %15

; <label>:15                                      ; preds = %9
  %16 = load i8*** %3, align 8
  %17 = getelementptr inbounds i8** %16, i64 3
  %18 = load i8** %17, align 8
  %19 = call i32 @strcmp(i8* %18, i8* getelementptr inbounds ([3 x i8]* @.str8, i32 0, i32 0)) #7
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %33, label %21

; <label>:21                                      ; preds = %15
  %22 = load i8*** %3, align 8
  %23 = getelementptr inbounds i8** %22, i64 5
  %24 = load i8** %23, align 8
  %25 = call i32 @strcmp(i8* %24, i8* getelementptr inbounds ([3 x i8]* @.str9, i32 0, i32 0)) #7
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %33, label %27

; <label>:27                                      ; preds = %21
  %28 = load i8*** %3, align 8
  %29 = getelementptr inbounds i8** %28, i64 7
  %30 = load i8** %29, align 8
  %31 = call i32 @strcmp(i8* %30, i8* getelementptr inbounds ([4 x i8]* @.str10, i32 0, i32 0)) #7
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %36

; <label>:33                                      ; preds = %27, %21, %15, %9
  %34 = load i8** %usage, align 8
  %35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str6, i32 0, i32 0), i8* %34)
  store i32 0, i32* %1
  br label %134

; <label>:36                                      ; preds = %27
  %37 = load i8*** %3, align 8
  %38 = getelementptr inbounds i8** %37, i64 2
  %39 = load i8** %38, align 8
  %40 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %39, i8* getelementptr inbounds ([3 x i8]* @.str11, i32 0, i32 0), i32* %IszX) #6
  %41 = icmp eq i32 %40, -1
  br i1 %41, label %42, label %44

; <label>:42                                      ; preds = %36
  %43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str12, i32 0, i32 0))
  store i32 0, i32* %1
  br label %134

; <label>:44                                      ; preds = %36
  %45 = load i32* %IszX, align 4
  %46 = icmp sle i32 %45, 0
  br i1 %46, label %47, label %49

; <label>:47                                      ; preds = %44
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str13, i32 0, i32 0))
  store i32 0, i32* %1
  br label %134

; <label>:49                                      ; preds = %44
  %50 = load i8*** %3, align 8
  %51 = getelementptr inbounds i8** %50, i64 4
  %52 = load i8** %51, align 8
  %53 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %52, i8* getelementptr inbounds ([3 x i8]* @.str11, i32 0, i32 0), i32* %IszY) #6
  %54 = icmp eq i32 %53, -1
  br i1 %54, label %55, label %57

; <label>:55                                      ; preds = %49
  %56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str14, i32 0, i32 0))
  store i32 0, i32* %1
  br label %134

; <label>:57                                      ; preds = %49
  %58 = load i32* %IszY, align 4
  %59 = icmp sle i32 %58, 0
  br i1 %59, label %60, label %62

; <label>:60                                      ; preds = %57
  %61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str15, i32 0, i32 0))
  store i32 0, i32* %1
  br label %134

; <label>:62                                      ; preds = %57
  %63 = load i8*** %3, align 8
  %64 = getelementptr inbounds i8** %63, i64 6
  %65 = load i8** %64, align 8
  %66 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %65, i8* getelementptr inbounds ([3 x i8]* @.str11, i32 0, i32 0), i32* %Nfr) #6
  %67 = icmp eq i32 %66, -1
  br i1 %67, label %68, label %70

; <label>:68                                      ; preds = %62
  %69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([43 x i8]* @.str16, i32 0, i32 0))
  store i32 0, i32* %1
  br label %134

; <label>:70                                      ; preds = %62
  %71 = load i32* %Nfr, align 4
  %72 = icmp sle i32 %71, 0
  br i1 %72, label %73, label %75

; <label>:73                                      ; preds = %70
  %74 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str17, i32 0, i32 0))
  store i32 0, i32* %1
  br label %134

; <label>:75                                      ; preds = %70
  %76 = load i8*** %3, align 8
  %77 = getelementptr inbounds i8** %76, i64 8
  %78 = load i8** %77, align 8
  %79 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %78, i8* getelementptr inbounds ([3 x i8]* @.str11, i32 0, i32 0), i32* %Nparticles) #6
  %80 = icmp eq i32 %79, -1
  br i1 %80, label %81, label %83

; <label>:81                                      ; preds = %75
  %82 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([46 x i8]* @.str18, i32 0, i32 0))
  store i32 0, i32* %1
  br label %134

; <label>:83                                      ; preds = %75
  %84 = load i32* %Nparticles, align 4
  %85 = icmp sle i32 %84, 0
  br i1 %85, label %86, label %88

; <label>:86                                      ; preds = %83
  %87 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str19, i32 0, i32 0))
  store i32 0, i32* %1
  br label %134

; <label>:88                                      ; preds = %83
  %89 = load i32* %Nparticles, align 4
  %90 = sext i32 %89 to i64
  %91 = mul i64 4, %90
  %92 = call noalias i8* @malloc(i64 %91) #6
  %93 = bitcast i8* %92 to i32*
  store i32* %93, i32** %seed, align 8
  store i32 0, i32* %i, align 4
  br label %94

; <label>:94                                      ; preds = %104, %88
  %95 = load i32* %i, align 4
  %96 = load i32* %Nparticles, align 4
  %97 = icmp slt i32 %95, %96
  br i1 %97, label %98, label %107

; <label>:98                                      ; preds = %94
  %99 = load i32* %i, align 4
  %100 = load i32* %i, align 4
  %101 = sext i32 %100 to i64
  %102 = load i32** %seed, align 8
  %103 = getelementptr inbounds i32* %102, i64 %101
  store i32 %99, i32* %103, align 4
  br label %104

; <label>:104                                     ; preds = %98
  %105 = load i32* %i, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, i32* %i, align 4
  br label %94

; <label>:107                                     ; preds = %94
  %108 = load i32* %IszX, align 4
  %109 = sext i32 %108 to i64
  %110 = mul i64 4, %109
  %111 = load i32* %IszY, align 4
  %112 = sext i32 %111 to i64
  %113 = mul i64 %110, %112
  %114 = load i32* %Nfr, align 4
  %115 = sext i32 %114 to i64
  %116 = mul i64 %113, %115
  %117 = call noalias i8* @malloc(i64 %116) #6
  %118 = bitcast i8* %117 to i32*
  store i32* %118, i32** %I, align 8
  %119 = load i32** %I, align 8
  %120 = load i32* %IszX, align 4
  %121 = load i32* %IszY, align 4
  %122 = load i32* %Nfr, align 4
  %123 = load i32** %seed, align 8
  call void @videoSequence(i32* %119, i32 %120, i32 %121, i32 %122, i32* %123)
  %124 = load i32** %I, align 8
  %125 = load i32* %IszX, align 4
  %126 = load i32* %IszY, align 4
  %127 = load i32* %Nfr, align 4
  %128 = load i32** %seed, align 8
  %129 = load i32* %Nparticles, align 4
  call void @particleFilter(i32* %124, i32 %125, i32 %126, i32 %127, i32* %128, i32 %129)
  %130 = load i32** %seed, align 8
  %131 = bitcast i32* %130 to i8*
  call void @free(i8* %131) #6
  %132 = load i32** %I, align 8
  %133 = bitcast i32* %132 to i8*
  call void @free(i8* %133) #6
  store i32 0, i32* %1
  br label %134

; <label>:134                                     ; preds = %107, %86, %81, %73, %68, %60, %55, %47, %42, %33, %6
  %135 = load i32* %1
  ret i32 %135
}

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #4

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8*, i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
