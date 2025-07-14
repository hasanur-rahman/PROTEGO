; ModuleID = 'needle.cpp'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@blosum62 = global [24 x [24 x i32]] [[24 x i32] [i32 4, i32 -1, i32 -2, i32 -2, i32 0, i32 -1, i32 -1, i32 0, i32 -2, i32 -1, i32 -1, i32 -1, i32 -1, i32 -2, i32 -1, i32 1, i32 0, i32 -3, i32 -2, i32 0, i32 -2, i32 -1, i32 0, i32 -4], [24 x i32] [i32 -1, i32 5, i32 0, i32 -2, i32 -3, i32 1, i32 0, i32 -2, i32 0, i32 -3, i32 -2, i32 2, i32 -1, i32 -3, i32 -2, i32 -1, i32 -1, i32 -3, i32 -2, i32 -3, i32 -1, i32 0, i32 -1, i32 -4], [24 x i32] [i32 -2, i32 0, i32 6, i32 1, i32 -3, i32 0, i32 0, i32 0, i32 1, i32 -3, i32 -3, i32 0, i32 -2, i32 -3, i32 -2, i32 1, i32 0, i32 -4, i32 -2, i32 -3, i32 3, i32 0, i32 -1, i32 -4], [24 x i32] [i32 -2, i32 -2, i32 1, i32 6, i32 -3, i32 0, i32 2, i32 -1, i32 -1, i32 -3, i32 -4, i32 -1, i32 -3, i32 -3, i32 -1, i32 0, i32 -1, i32 -4, i32 -3, i32 -3, i32 4, i32 1, i32 -1, i32 -4], [24 x i32] [i32 0, i32 -3, i32 -3, i32 -3, i32 9, i32 -3, i32 -4, i32 -3, i32 -3, i32 -1, i32 -1, i32 -3, i32 -1, i32 -2, i32 -3, i32 -1, i32 -1, i32 -2, i32 -2, i32 -1, i32 -3, i32 -3, i32 -2, i32 -4], [24 x i32] [i32 -1, i32 1, i32 0, i32 0, i32 -3, i32 5, i32 2, i32 -2, i32 0, i32 -3, i32 -2, i32 1, i32 0, i32 -3, i32 -1, i32 0, i32 -1, i32 -2, i32 -1, i32 -2, i32 0, i32 3, i32 -1, i32 -4], [24 x i32] [i32 -1, i32 0, i32 0, i32 2, i32 -4, i32 2, i32 5, i32 -2, i32 0, i32 -3, i32 -3, i32 1, i32 -2, i32 -3, i32 -1, i32 0, i32 -1, i32 -3, i32 -2, i32 -2, i32 1, i32 4, i32 -1, i32 -4], [24 x i32] [i32 0, i32 -2, i32 0, i32 -1, i32 -3, i32 -2, i32 -2, i32 6, i32 -2, i32 -4, i32 -4, i32 -2, i32 -3, i32 -3, i32 -2, i32 0, i32 -2, i32 -2, i32 -3, i32 -3, i32 -1, i32 -2, i32 -1, i32 -4], [24 x i32] [i32 -2, i32 0, i32 1, i32 -1, i32 -3, i32 0, i32 0, i32 -2, i32 8, i32 -3, i32 -3, i32 -1, i32 -2, i32 -1, i32 -2, i32 -1, i32 -2, i32 -2, i32 2, i32 -3, i32 0, i32 0, i32 -1, i32 -4], [24 x i32] [i32 -1, i32 -3, i32 -3, i32 -3, i32 -1, i32 -3, i32 -3, i32 -4, i32 -3, i32 4, i32 2, i32 -3, i32 1, i32 0, i32 -3, i32 -2, i32 -1, i32 -3, i32 -1, i32 3, i32 -3, i32 -3, i32 -1, i32 -4], [24 x i32] [i32 -1, i32 -2, i32 -3, i32 -4, i32 -1, i32 -2, i32 -3, i32 -4, i32 -3, i32 2, i32 4, i32 -2, i32 2, i32 0, i32 -3, i32 -2, i32 -1, i32 -2, i32 -1, i32 1, i32 -4, i32 -3, i32 -1, i32 -4], [24 x i32] [i32 -1, i32 2, i32 0, i32 -1, i32 -3, i32 1, i32 1, i32 -2, i32 -1, i32 -3, i32 -2, i32 5, i32 -1, i32 -3, i32 -1, i32 0, i32 -1, i32 -3, i32 -2, i32 -2, i32 0, i32 1, i32 -1, i32 -4], [24 x i32] [i32 -1, i32 -1, i32 -2, i32 -3, i32 -1, i32 0, i32 -2, i32 -3, i32 -2, i32 1, i32 2, i32 -1, i32 5, i32 0, i32 -2, i32 -1, i32 -1, i32 -1, i32 -1, i32 1, i32 -3, i32 -1, i32 -1, i32 -4], [24 x i32] [i32 -2, i32 -3, i32 -3, i32 -3, i32 -2, i32 -3, i32 -3, i32 -3, i32 -1, i32 0, i32 0, i32 -3, i32 0, i32 6, i32 -4, i32 -2, i32 -2, i32 1, i32 3, i32 -1, i32 -3, i32 -3, i32 -1, i32 -4], [24 x i32] [i32 -1, i32 -2, i32 -2, i32 -1, i32 -3, i32 -1, i32 -1, i32 -2, i32 -2, i32 -3, i32 -3, i32 -1, i32 -2, i32 -4, i32 7, i32 -1, i32 -1, i32 -4, i32 -3, i32 -2, i32 -2, i32 -1, i32 -2, i32 -4], [24 x i32] [i32 1, i32 -1, i32 1, i32 0, i32 -1, i32 0, i32 0, i32 0, i32 -1, i32 -2, i32 -2, i32 0, i32 -1, i32 -2, i32 -1, i32 4, i32 1, i32 -3, i32 -2, i32 -2, i32 0, i32 0, i32 0, i32 -4], [24 x i32] [i32 0, i32 -1, i32 0, i32 -1, i32 -1, i32 -1, i32 -1, i32 -2, i32 -2, i32 -1, i32 -1, i32 -1, i32 -1, i32 -2, i32 -1, i32 1, i32 5, i32 -2, i32 -2, i32 0, i32 -1, i32 -1, i32 0, i32 -4], [24 x i32] [i32 -3, i32 -3, i32 -4, i32 -4, i32 -2, i32 -2, i32 -3, i32 -2, i32 -2, i32 -3, i32 -2, i32 -3, i32 -1, i32 1, i32 -4, i32 -3, i32 -2, i32 11, i32 2, i32 -3, i32 -4, i32 -3, i32 -2, i32 -4], [24 x i32] [i32 -2, i32 -2, i32 -2, i32 -3, i32 -2, i32 -1, i32 -2, i32 -3, i32 2, i32 -1, i32 -1, i32 -2, i32 -1, i32 3, i32 -3, i32 -2, i32 -2, i32 2, i32 7, i32 -1, i32 -3, i32 -2, i32 -1, i32 -4], [24 x i32] [i32 0, i32 -3, i32 -3, i32 -3, i32 -1, i32 -2, i32 -2, i32 -3, i32 -3, i32 3, i32 1, i32 -2, i32 1, i32 -1, i32 -2, i32 -2, i32 0, i32 -3, i32 -1, i32 4, i32 -3, i32 -2, i32 -1, i32 -4], [24 x i32] [i32 -2, i32 -1, i32 3, i32 4, i32 -3, i32 0, i32 1, i32 -1, i32 0, i32 -3, i32 -4, i32 0, i32 -3, i32 -3, i32 -2, i32 0, i32 -1, i32 -4, i32 -3, i32 -3, i32 4, i32 1, i32 -1, i32 -4], [24 x i32] [i32 -1, i32 0, i32 0, i32 1, i32 -3, i32 3, i32 4, i32 -2, i32 0, i32 -3, i32 -3, i32 1, i32 -1, i32 -3, i32 -1, i32 0, i32 -1, i32 -3, i32 -2, i32 -2, i32 1, i32 4, i32 -1, i32 -4], [24 x i32] [i32 0, i32 -1, i32 -1, i32 -1, i32 -2, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -2, i32 0, i32 0, i32 -2, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -4], [24 x i32] [i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 -4, i32 1]], align 16
@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [55 x i8] c"Usage: %s <max_rows/max_cols> <penalty> <num_threads>\0A\00", align 1
@.str1 = private unnamed_addr constant [40 x i8] c"\09<dimension>      - x and y dimensions\0A\00", align 1
@.str2 = private unnamed_addr constant [47 x i8] c"\09<penalty>        - penalty(positive integer)\0A\00", align 1
@.str3 = private unnamed_addr constant [36 x i8] c"\09<num_threads>    - no. of threads\0A\00", align 1
@.str4 = private unnamed_addr constant [32 x i8] c"Processing bottom-right matrix\0A\00", align 1
@.str5 = private unnamed_addr constant [31 x i8] c"error: can not allocate memory\00", align 1
@.str6 = private unnamed_addr constant [24 x i8] c"Start Needleman-Wunsch\0A\00", align 1
@.str7 = private unnamed_addr constant [20 x i8] c"Num of threads: %d\0A\00", align 1
@.str8 = private unnamed_addr constant [28 x i8] c"Processing top-left matrix\0A\00", align 1
@.str9 = private unnamed_addr constant [26 x i8] c"Total time: %.3f seconds\0A\00", align 1
@.str10 = private unnamed_addr constant [11 x i8] c"result.txt\00", align 1
@.str11 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str12 = private unnamed_addr constant [28 x i8] c"print traceback value GPU:\0A\00", align 1
@.str13 = private unnamed_addr constant [4 x i8] c"%d \00", align 1

; Function Attrs: nounwind uwtable
define i64 @_Z8get_timev() #0 {
  %tv = alloca %struct.timeval, align 8
  %1 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* null) #6
  %2 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 0
  %3 = load i64* %2, align 8
  %4 = mul nsw i64 %3, 1000000
  %5 = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 1
  %6 = load i64* %5, align 8
  %7 = add nsw i64 %4, %6
  ret i64 %7
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #1

; Function Attrs: nounwind uwtable
define i32 @_Z7maximumiii(i32 %a, i32 %b, i32 %c) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %a, i32* %2, align 4
  store i32 %b, i32* %3, align 4
  store i32 %c, i32* %4, align 4
  %5 = load i32* %2, align 4
  %6 = load i32* %3, align 4
  %7 = icmp sle i32 %5, %6
  br i1 %7, label %8, label %10

; <label>:8                                       ; preds = %0
  %9 = load i32* %3, align 4
  store i32 %9, i32* %k, align 4
  br label %12

; <label>:10                                      ; preds = %0
  %11 = load i32* %2, align 4
  store i32 %11, i32* %k, align 4
  br label %12

; <label>:12                                      ; preds = %10, %8
  %13 = load i32* %k, align 4
  %14 = load i32* %4, align 4
  %15 = icmp sle i32 %13, %14
  br i1 %15, label %16, label %18

; <label>:16                                      ; preds = %12
  %17 = load i32* %4, align 4
  store i32 %17, i32* %1
  br label %20

; <label>:18                                      ; preds = %12
  %19 = load i32* %k, align 4
  store i32 %19, i32* %1
  br label %20

; <label>:20                                      ; preds = %18, %16
  %21 = load i32* %1
  ret i32 %21
}

; Function Attrs: nounwind uwtable
define double @_Z7gettimev() #0 {
  %t = alloca %struct.timeval, align 8
  %1 = call i32 @gettimeofday(%struct.timeval* %t, %struct.timezone* null) #6
  %2 = getelementptr inbounds %struct.timeval* %t, i32 0, i32 0
  %3 = load i64* %2, align 8
  %4 = sitofp i64 %3 to double
  %5 = getelementptr inbounds %struct.timeval* %t, i32 0, i32 1
  %6 = load i64* %5, align 8
  %7 = sitofp i64 %6 to double
  %8 = fmul double %7, 1.000000e-06
  %9 = fadd double %4, %8
  ret double %9
}

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #2 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i32* %2, align 4
  %5 = load i8*** %3, align 8
  call void @_Z7runTestiPPc(i32 %4, i8** %5)
  ret i32 0
}

; Function Attrs: uwtable
define void @_Z7runTestiPPc(i32 %argc, i8** %argv) #2 {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  %max_rows = alloca i32, align 4
  %max_cols = alloca i32, align 4
  %penalty = alloca i32, align 4
  %input_itemsets = alloca i32*, align 8
  %output_itemsets = alloca i32*, align 8
  %referrence = alloca i32*, align 8
  %omp_num_threads = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %i1 = alloca i32, align 4
  %j2 = alloca i32, align 4
  %i3 = alloca i32, align 4
  %j4 = alloca i32, align 4
  %i5 = alloca i32, align 4
  %j6 = alloca i32, align 4
  %start_time = alloca i64, align 8
  %end_time = alloca i64, align 8
  %fpo = alloca %struct._IO_FILE*, align 8
  %i7 = alloca i32, align 4
  %j8 = alloca i32, align 4
  %nw = alloca i32, align 4
  %n = alloca i32, align 4
  %w = alloca i32, align 4
  %traceback = alloca i32, align 4
  %new_nw = alloca i32, align 4
  %new_w = alloca i32, align 4
  %new_n = alloca i32, align 4
  store i32 %argc, i32* %1, align 4
  store i8** %argv, i8*** %2, align 8
  %3 = load i32* %1, align 4
  %4 = icmp eq i32 %3, 4
  br i1 %4, label %5, label %22

; <label>:5                                       ; preds = %0
  %6 = load i8*** %2, align 8
  %7 = getelementptr inbounds i8** %6, i64 1
  %8 = load i8** %7, align 8
  %9 = call i32 @atoi(i8* %8) #7
  store i32 %9, i32* %max_rows, align 4
  %10 = load i8*** %2, align 8
  %11 = getelementptr inbounds i8** %10, i64 1
  %12 = load i8** %11, align 8
  %13 = call i32 @atoi(i8* %12) #7
  store i32 %13, i32* %max_cols, align 4
  %14 = load i8*** %2, align 8
  %15 = getelementptr inbounds i8** %14, i64 2
  %16 = load i8** %15, align 8
  %17 = call i32 @atoi(i8* %16) #7
  store i32 %17, i32* %penalty, align 4
  %18 = load i8*** %2, align 8
  %19 = getelementptr inbounds i8** %18, i64 3
  %20 = load i8** %19, align 8
  %21 = call i32 @atoi(i8* %20) #7
  store i32 %21, i32* %omp_num_threads, align 4
  br label %25

; <label>:22                                      ; preds = %0
  %23 = load i32* %1, align 4
  %24 = load i8*** %2, align 8
  call void @_Z5usageiPPc(i32 %23, i8** %24)
  br label %25

; <label>:25                                      ; preds = %22, %5
  %26 = load i32* %max_rows, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %max_rows, align 4
  %28 = load i32* %max_cols, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %max_cols, align 4
  %30 = load i32* %max_rows, align 4
  %31 = load i32* %max_cols, align 4
  %32 = mul nsw i32 %30, %31
  %33 = sext i32 %32 to i64
  %34 = mul i64 %33, 4
  %35 = call noalias i8* @malloc(i64 %34) #6
  %36 = bitcast i8* %35 to i32*
  store i32* %36, i32** %referrence, align 8
  %37 = load i32* %max_rows, align 4
  %38 = load i32* %max_cols, align 4
  %39 = mul nsw i32 %37, %38
  %40 = sext i32 %39 to i64
  %41 = mul i64 %40, 4
  %42 = call noalias i8* @malloc(i64 %41) #6
  %43 = bitcast i8* %42 to i32*
  store i32* %43, i32** %input_itemsets, align 8
  %44 = load i32* %max_rows, align 4
  %45 = load i32* %max_cols, align 4
  %46 = mul nsw i32 %44, %45
  %47 = sext i32 %46 to i64
  %48 = mul i64 %47, 4
  %49 = call noalias i8* @malloc(i64 %48) #6
  %50 = bitcast i8* %49 to i32*
  store i32* %50, i32** %output_itemsets, align 8
  %51 = load i32** %input_itemsets, align 8
  %52 = icmp ne i32* %51, null
  br i1 %52, label %56, label %53

; <label>:53                                      ; preds = %25
  %54 = load %struct._IO_FILE** @stderr, align 8
  %55 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([31 x i8]* @.str5, i32 0, i32 0))
  br label %56

; <label>:56                                      ; preds = %53, %25
  call void @srand(i32 7) #6
  store i32 0, i32* %i, align 4
  br label %57

; <label>:57                                      ; preds = %79, %56
  %58 = load i32* %i, align 4
  %59 = load i32* %max_cols, align 4
  %60 = icmp slt i32 %58, %59
  br i1 %60, label %61, label %82

; <label>:61                                      ; preds = %57
  store i32 0, i32* %j, align 4
  br label %62

; <label>:62                                      ; preds = %75, %61
  %63 = load i32* %j, align 4
  %64 = load i32* %max_rows, align 4
  %65 = icmp slt i32 %63, %64
  br i1 %65, label %66, label %78

; <label>:66                                      ; preds = %62
  %67 = load i32* %i, align 4
  %68 = load i32* %max_cols, align 4
  %69 = mul nsw i32 %67, %68
  %70 = load i32* %j, align 4
  %71 = add nsw i32 %69, %70
  %72 = sext i32 %71 to i64
  %73 = load i32** %input_itemsets, align 8
  %74 = getelementptr inbounds i32* %73, i64 %72
  store i32 0, i32* %74, align 4
  br label %75

; <label>:75                                      ; preds = %66
  %76 = load i32* %j, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, i32* %j, align 4
  br label %62

; <label>:78                                      ; preds = %62
  br label %79

; <label>:79                                      ; preds = %78
  %80 = load i32* %i, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, i32* %i, align 4
  br label %57

; <label>:82                                      ; preds = %57
  %83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str6, i32 0, i32 0))
  store i32 1, i32* %i1, align 4
  br label %84

; <label>:84                                      ; preds = %98, %82
  %85 = load i32* %i1, align 4
  %86 = load i32* %max_rows, align 4
  %87 = icmp slt i32 %85, %86
  br i1 %87, label %88, label %101

; <label>:88                                      ; preds = %84
  %89 = call i32 @rand() #6
  %90 = srem i32 %89, 10
  %91 = add nsw i32 %90, 1
  %92 = load i32* %i1, align 4
  %93 = load i32* %max_cols, align 4
  %94 = mul nsw i32 %92, %93
  %95 = sext i32 %94 to i64
  %96 = load i32** %input_itemsets, align 8
  %97 = getelementptr inbounds i32* %96, i64 %95
  store i32 %91, i32* %97, align 4
  br label %98

; <label>:98                                      ; preds = %88
  %99 = load i32* %i1, align 4
  %100 = add nsw i32 %99, 1
  store i32 %100, i32* %i1, align 4
  br label %84

; <label>:101                                     ; preds = %84
  store i32 1, i32* %j2, align 4
  br label %102

; <label>:102                                     ; preds = %114, %101
  %103 = load i32* %j2, align 4
  %104 = load i32* %max_cols, align 4
  %105 = icmp slt i32 %103, %104
  br i1 %105, label %106, label %117

; <label>:106                                     ; preds = %102
  %107 = call i32 @rand() #6
  %108 = srem i32 %107, 10
  %109 = add nsw i32 %108, 1
  %110 = load i32* %j2, align 4
  %111 = sext i32 %110 to i64
  %112 = load i32** %input_itemsets, align 8
  %113 = getelementptr inbounds i32* %112, i64 %111
  store i32 %109, i32* %113, align 4
  br label %114

; <label>:114                                     ; preds = %106
  %115 = load i32* %j2, align 4
  %116 = add nsw i32 %115, 1
  store i32 %116, i32* %j2, align 4
  br label %102

; <label>:117                                     ; preds = %102
  store i32 1, i32* %i3, align 4
  br label %118

; <label>:118                                     ; preds = %157, %117
  %119 = load i32* %i3, align 4
  %120 = load i32* %max_cols, align 4
  %121 = icmp slt i32 %119, %120
  br i1 %121, label %122, label %160

; <label>:122                                     ; preds = %118
  store i32 1, i32* %j4, align 4
  br label %123

; <label>:123                                     ; preds = %153, %122
  %124 = load i32* %j4, align 4
  %125 = load i32* %max_rows, align 4
  %126 = icmp slt i32 %124, %125
  br i1 %126, label %127, label %156

; <label>:127                                     ; preds = %123
  %128 = load i32* %j4, align 4
  %129 = sext i32 %128 to i64
  %130 = load i32** %input_itemsets, align 8
  %131 = getelementptr inbounds i32* %130, i64 %129
  %132 = load i32* %131, align 4
  %133 = sext i32 %132 to i64
  %134 = load i32* %i3, align 4
  %135 = load i32* %max_cols, align 4
  %136 = mul nsw i32 %134, %135
  %137 = sext i32 %136 to i64
  %138 = load i32** %input_itemsets, align 8
  %139 = getelementptr inbounds i32* %138, i64 %137
  %140 = load i32* %139, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [24 x [24 x i32]]* @blosum62, i32 0, i64 %141
  %143 = getelementptr inbounds [24 x i32]* %142, i32 0, i64 %133
  %144 = load i32* %143, align 4
  %145 = load i32* %i3, align 4
  %146 = load i32* %max_cols, align 4
  %147 = mul nsw i32 %145, %146
  %148 = load i32* %j4, align 4
  %149 = add nsw i32 %147, %148
  %150 = sext i32 %149 to i64
  %151 = load i32** %referrence, align 8
  %152 = getelementptr inbounds i32* %151, i64 %150
  store i32 %144, i32* %152, align 4
  br label %153

; <label>:153                                     ; preds = %127
  %154 = load i32* %j4, align 4
  %155 = add nsw i32 %154, 1
  store i32 %155, i32* %j4, align 4
  br label %123

; <label>:156                                     ; preds = %123
  br label %157

; <label>:157                                     ; preds = %156
  %158 = load i32* %i3, align 4
  %159 = add nsw i32 %158, 1
  store i32 %159, i32* %i3, align 4
  br label %118

; <label>:160                                     ; preds = %118
  store i32 1, i32* %i5, align 4
  br label %161

; <label>:161                                     ; preds = %176, %160
  %162 = load i32* %i5, align 4
  %163 = load i32* %max_rows, align 4
  %164 = icmp slt i32 %162, %163
  br i1 %164, label %165, label %179

; <label>:165                                     ; preds = %161
  %166 = load i32* %i5, align 4
  %167 = sub nsw i32 0, %166
  %168 = load i32* %penalty, align 4
  %169 = mul nsw i32 %167, %168
  %170 = load i32* %i5, align 4
  %171 = load i32* %max_cols, align 4
  %172 = mul nsw i32 %170, %171
  %173 = sext i32 %172 to i64
  %174 = load i32** %input_itemsets, align 8
  %175 = getelementptr inbounds i32* %174, i64 %173
  store i32 %169, i32* %175, align 4
  br label %176

; <label>:176                                     ; preds = %165
  %177 = load i32* %i5, align 4
  %178 = add nsw i32 %177, 1
  store i32 %178, i32* %i5, align 4
  br label %161

; <label>:179                                     ; preds = %161
  store i32 1, i32* %j6, align 4
  br label %180

; <label>:180                                     ; preds = %193, %179
  %181 = load i32* %j6, align 4
  %182 = load i32* %max_cols, align 4
  %183 = icmp slt i32 %181, %182
  br i1 %183, label %184, label %196

; <label>:184                                     ; preds = %180
  %185 = load i32* %j6, align 4
  %186 = sub nsw i32 0, %185
  %187 = load i32* %penalty, align 4
  %188 = mul nsw i32 %186, %187
  %189 = load i32* %j6, align 4
  %190 = sext i32 %189 to i64
  %191 = load i32** %input_itemsets, align 8
  %192 = getelementptr inbounds i32* %191, i64 %190
  store i32 %188, i32* %192, align 4
  br label %193

; <label>:193                                     ; preds = %184
  %194 = load i32* %j6, align 4
  %195 = add nsw i32 %194, 1
  store i32 %195, i32* %j6, align 4
  br label %180

; <label>:196                                     ; preds = %180
  %197 = load i32* %omp_num_threads, align 4
  %198 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str7, i32 0, i32 0), i32 %197)
  %199 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str8, i32 0, i32 0))
  %200 = call i64 @_Z8get_timev()
  store i64 %200, i64* %start_time, align 8
  %201 = load i32** %input_itemsets, align 8
  %202 = load i32** %output_itemsets, align 8
  %203 = load i32** %referrence, align 8
  %204 = load i32* %max_rows, align 4
  %205 = load i32* %max_cols, align 4
  %206 = load i32* %penalty, align 4
  call void @_Z12nw_optimizedPiS_S_iii(i32* %201, i32* %202, i32* %203, i32 %204, i32 %205, i32 %206)
  %207 = call i64 @_Z8get_timev()
  store i64 %207, i64* %end_time, align 8
  %208 = load i64* %end_time, align 8
  %209 = load i64* %start_time, align 8
  %210 = sub nsw i64 %208, %209
  %211 = sitofp i64 %210 to float
  %212 = fdiv float %211, 1.000000e+06
  %213 = fpext float %212 to double
  %214 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str9, i32 0, i32 0), double %213)
  %215 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8]* @.str10, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str11, i32 0, i32 0))
  store %struct._IO_FILE* %215, %struct._IO_FILE** %fpo, align 8
  %216 = load %struct._IO_FILE** %fpo, align 8
  %217 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %216, i8* getelementptr inbounds ([28 x i8]* @.str12, i32 0, i32 0))
  %218 = load i32* %max_rows, align 4
  %219 = sub nsw i32 %218, 2
  store i32 %219, i32* %i7, align 4
  %220 = load i32* %max_rows, align 4
  %221 = sub nsw i32 %220, 2
  store i32 %221, i32* %j8, align 4
  br label %222

; <label>:222                                     ; preds = %393, %387, %380, %371, %196
  %223 = load i32* %i7, align 4
  %224 = icmp sge i32 %223, 0
  %225 = load i32* %j8, align 4
  %226 = icmp sge i32 %225, 0
  br i1 %226, label %227, label %394

; <label>:227                                     ; preds = %222
  %228 = load i32* %i7, align 4
  %229 = load i32* %max_rows, align 4
  %230 = sub nsw i32 %229, 2
  %231 = icmp eq i32 %228, %230
  br i1 %231, label %232, label %249

; <label>:232                                     ; preds = %227
  %233 = load i32* %j8, align 4
  %234 = load i32* %max_rows, align 4
  %235 = sub nsw i32 %234, 2
  %236 = icmp eq i32 %233, %235
  br i1 %236, label %237, label %249

; <label>:237                                     ; preds = %232
  %238 = load %struct._IO_FILE** %fpo, align 8
  %239 = load i32* %i7, align 4
  %240 = load i32* %max_cols, align 4
  %241 = mul nsw i32 %239, %240
  %242 = load i32* %j8, align 4
  %243 = add nsw i32 %241, %242
  %244 = sext i32 %243 to i64
  %245 = load i32** %input_itemsets, align 8
  %246 = getelementptr inbounds i32* %245, i64 %244
  %247 = load i32* %246, align 4
  %248 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %238, i8* getelementptr inbounds ([4 x i8]* @.str13, i32 0, i32 0), i32 %247)
  br label %249

; <label>:249                                     ; preds = %237, %232, %227
  %250 = load i32* %i7, align 4
  %251 = icmp eq i32 %250, 0
  br i1 %251, label %252, label %256

; <label>:252                                     ; preds = %249
  %253 = load i32* %j8, align 4
  %254 = icmp eq i32 %253, 0
  br i1 %254, label %255, label %256

; <label>:255                                     ; preds = %252
  br label %394

; <label>:256                                     ; preds = %252, %249
  %257 = load i32* %i7, align 4
  %258 = icmp sgt i32 %257, 0
  br i1 %258, label %259, label %294

; <label>:259                                     ; preds = %256
  %260 = load i32* %j8, align 4
  %261 = icmp sgt i32 %260, 0
  br i1 %261, label %262, label %294

; <label>:262                                     ; preds = %259
  %263 = load i32* %i7, align 4
  %264 = sub nsw i32 %263, 1
  %265 = load i32* %max_cols, align 4
  %266 = mul nsw i32 %264, %265
  %267 = load i32* %j8, align 4
  %268 = add nsw i32 %266, %267
  %269 = sub nsw i32 %268, 1
  %270 = sext i32 %269 to i64
  %271 = load i32** %input_itemsets, align 8
  %272 = getelementptr inbounds i32* %271, i64 %270
  %273 = load i32* %272, align 4
  store i32 %273, i32* %nw, align 4
  %274 = load i32* %i7, align 4
  %275 = load i32* %max_cols, align 4
  %276 = mul nsw i32 %274, %275
  %277 = load i32* %j8, align 4
  %278 = add nsw i32 %276, %277
  %279 = sub nsw i32 %278, 1
  %280 = sext i32 %279 to i64
  %281 = load i32** %input_itemsets, align 8
  %282 = getelementptr inbounds i32* %281, i64 %280
  %283 = load i32* %282, align 4
  store i32 %283, i32* %w, align 4
  %284 = load i32* %i7, align 4
  %285 = sub nsw i32 %284, 1
  %286 = load i32* %max_cols, align 4
  %287 = mul nsw i32 %285, %286
  %288 = load i32* %j8, align 4
  %289 = add nsw i32 %287, %288
  %290 = sext i32 %289 to i64
  %291 = load i32** %input_itemsets, align 8
  %292 = getelementptr inbounds i32* %291, i64 %290
  %293 = load i32* %292, align 4
  store i32 %293, i32* %n, align 4
  br label %325

; <label>:294                                     ; preds = %259, %256
  %295 = load i32* %i7, align 4
  %296 = icmp eq i32 %295, 0
  br i1 %296, label %297, label %308

; <label>:297                                     ; preds = %294
  store i32 -999, i32* %n, align 4
  store i32 -999, i32* %nw, align 4
  %298 = load i32* %i7, align 4
  %299 = load i32* %max_cols, align 4
  %300 = mul nsw i32 %298, %299
  %301 = load i32* %j8, align 4
  %302 = add nsw i32 %300, %301
  %303 = sub nsw i32 %302, 1
  %304 = sext i32 %303 to i64
  %305 = load i32** %input_itemsets, align 8
  %306 = getelementptr inbounds i32* %305, i64 %304
  %307 = load i32* %306, align 4
  store i32 %307, i32* %w, align 4
  br label %324

; <label>:308                                     ; preds = %294
  %309 = load i32* %j8, align 4
  %310 = icmp eq i32 %309, 0
  br i1 %310, label %311, label %322

; <label>:311                                     ; preds = %308
  store i32 -999, i32* %w, align 4
  store i32 -999, i32* %nw, align 4
  %312 = load i32* %i7, align 4
  %313 = sub nsw i32 %312, 1
  %314 = load i32* %max_cols, align 4
  %315 = mul nsw i32 %313, %314
  %316 = load i32* %j8, align 4
  %317 = add nsw i32 %315, %316
  %318 = sext i32 %317 to i64
  %319 = load i32** %input_itemsets, align 8
  %320 = getelementptr inbounds i32* %319, i64 %318
  %321 = load i32* %320, align 4
  store i32 %321, i32* %n, align 4
  br label %323

; <label>:322                                     ; preds = %308
  br label %323

; <label>:323                                     ; preds = %322, %311
  br label %324

; <label>:324                                     ; preds = %323, %297
  br label %325

; <label>:325                                     ; preds = %324, %262
  %326 = load i32* %nw, align 4
  %327 = load i32* %i7, align 4
  %328 = load i32* %max_cols, align 4
  %329 = mul nsw i32 %327, %328
  %330 = load i32* %j8, align 4
  %331 = add nsw i32 %329, %330
  %332 = sext i32 %331 to i64
  %333 = load i32** %referrence, align 8
  %334 = getelementptr inbounds i32* %333, i64 %332
  %335 = load i32* %334, align 4
  %336 = add nsw i32 %326, %335
  store i32 %336, i32* %new_nw, align 4
  %337 = load i32* %w, align 4
  %338 = load i32* %penalty, align 4
  %339 = sub nsw i32 %337, %338
  store i32 %339, i32* %new_w, align 4
  %340 = load i32* %n, align 4
  %341 = load i32* %penalty, align 4
  %342 = sub nsw i32 %340, %341
  store i32 %342, i32* %new_n, align 4
  %343 = load i32* %new_nw, align 4
  %344 = load i32* %new_w, align 4
  %345 = load i32* %new_n, align 4
  %346 = call i32 @_Z7maximumiii(i32 %343, i32 %344, i32 %345)
  store i32 %346, i32* %traceback, align 4
  %347 = load i32* %traceback, align 4
  %348 = load i32* %new_nw, align 4
  %349 = icmp eq i32 %347, %348
  br i1 %349, label %350, label %352

; <label>:350                                     ; preds = %325
  %351 = load i32* %nw, align 4
  store i32 %351, i32* %traceback, align 4
  br label %352

; <label>:352                                     ; preds = %350, %325
  %353 = load i32* %traceback, align 4
  %354 = load i32* %new_w, align 4
  %355 = icmp eq i32 %353, %354
  br i1 %355, label %356, label %358

; <label>:356                                     ; preds = %352
  %357 = load i32* %w, align 4
  store i32 %357, i32* %traceback, align 4
  br label %358

; <label>:358                                     ; preds = %356, %352
  %359 = load i32* %traceback, align 4
  %360 = load i32* %new_n, align 4
  %361 = icmp eq i32 %359, %360
  br i1 %361, label %362, label %364

; <label>:362                                     ; preds = %358
  %363 = load i32* %n, align 4
  store i32 %363, i32* %traceback, align 4
  br label %364

; <label>:364                                     ; preds = %362, %358
  %365 = load %struct._IO_FILE** %fpo, align 8
  %366 = load i32* %traceback, align 4
  %367 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %365, i8* getelementptr inbounds ([4 x i8]* @.str13, i32 0, i32 0), i32 %366)
  %368 = load i32* %traceback, align 4
  %369 = load i32* %nw, align 4
  %370 = icmp eq i32 %368, %369
  br i1 %370, label %371, label %376

; <label>:371                                     ; preds = %364
  %372 = load i32* %i7, align 4
  %373 = add nsw i32 %372, -1
  store i32 %373, i32* %i7, align 4
  %374 = load i32* %j8, align 4
  %375 = add nsw i32 %374, -1
  store i32 %375, i32* %j8, align 4
  br label %222

; <label>:376                                     ; preds = %364
  %377 = load i32* %traceback, align 4
  %378 = load i32* %w, align 4
  %379 = icmp eq i32 %377, %378
  br i1 %379, label %380, label %383

; <label>:380                                     ; preds = %376
  %381 = load i32* %j8, align 4
  %382 = add nsw i32 %381, -1
  store i32 %382, i32* %j8, align 4
  br label %222

; <label>:383                                     ; preds = %376
  %384 = load i32* %traceback, align 4
  %385 = load i32* %n, align 4
  %386 = icmp eq i32 %384, %385
  br i1 %386, label %387, label %390

; <label>:387                                     ; preds = %383
  %388 = load i32* %i7, align 4
  %389 = add nsw i32 %388, -1
  store i32 %389, i32* %i7, align 4
  br label %222

; <label>:390                                     ; preds = %383
  br label %391

; <label>:391                                     ; preds = %390
  br label %392

; <label>:392                                     ; preds = %391
  br label %393

; <label>:393                                     ; preds = %392
  br label %222

; <label>:394                                     ; preds = %255, %222
  %395 = load %struct._IO_FILE** %fpo, align 8
  %396 = call i32 @fclose(%struct._IO_FILE* %395)
  %397 = load i32** %referrence, align 8
  %398 = bitcast i32* %397 to i8*
  call void @free(i8* %398) #6
  %399 = load i32** %input_itemsets, align 8
  %400 = bitcast i32* %399 to i8*
  call void @free(i8* %400) #6
  %401 = load i32** %output_itemsets, align 8
  %402 = bitcast i32* %401 to i8*
  call void @free(i8* %402) #6
  ret void
}

; Function Attrs: uwtable
define void @_Z5usageiPPc(i32 %argc, i8** %argv) #2 {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  store i32 %argc, i32* %1, align 4
  store i8** %argv, i8*** %2, align 8
  %3 = load %struct._IO_FILE** @stderr, align 8
  %4 = load i8*** %2, align 8
  %5 = getelementptr inbounds i8** %4, i64 0
  %6 = load i8** %5, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([55 x i8]* @.str, i32 0, i32 0), i8* %6)
  %8 = load %struct._IO_FILE** @stderr, align 8
  %9 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([40 x i8]* @.str1, i32 0, i32 0))
  %10 = load %struct._IO_FILE** @stderr, align 8
  %11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([47 x i8]* @.str2, i32 0, i32 0))
  %12 = load %struct._IO_FILE** @stderr, align 8
  %13 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([36 x i8]* @.str3, i32 0, i32 0))
  call void @exit(i32 1) #8
  unreachable
                                                  ; No predecessors!
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #4

; Function Attrs: uwtable
define void @_Z12nw_optimizedPiS_S_iii(i32* %input_itemsets, i32* %output_itemsets, i32* %referrence, i32 %max_rows, i32 %max_cols, i32 %penalty) #2 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %blk = alloca i32, align 4
  %b_index_x = alloca i32, align 4
  %b_index_y = alloca i32, align 4
  %input_itemsets_l = alloca [289 x i32], align 64
  %reference_l = alloca [256 x i32], align 64
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %i1 = alloca i32, align 4
  %j2 = alloca i32, align 4
  %i3 = alloca i32, align 4
  %j4 = alloca i32, align 4
  %i5 = alloca i32, align 4
  %j6 = alloca i32, align 4
  %blk7 = alloca i32, align 4
  %b_index_x8 = alloca i32, align 4
  %b_index_y9 = alloca i32, align 4
  %input_itemsets_l10 = alloca [289 x i32], align 64
  %reference_l11 = alloca [256 x i32], align 64
  %i12 = alloca i32, align 4
  %j13 = alloca i32, align 4
  %i14 = alloca i32, align 4
  %j15 = alloca i32, align 4
  %i16 = alloca i32, align 4
  %j17 = alloca i32, align 4
  %i18 = alloca i32, align 4
  %j19 = alloca i32, align 4
  store i32* %input_itemsets, i32** %1, align 8
  store i32* %output_itemsets, i32** %2, align 8
  store i32* %referrence, i32** %3, align 8
  store i32 %max_rows, i32* %4, align 4
  store i32 %max_cols, i32* %5, align 4
  store i32 %penalty, i32* %6, align 4
  store i32 1, i32* %blk, align 4
  br label %7

; <label>:7                                       ; preds = %206, %0
  %8 = load i32* %blk, align 4
  %9 = load i32* %5, align 4
  %10 = sub nsw i32 %9, 1
  %11 = sdiv i32 %10, 16
  %12 = icmp sle i32 %8, %11
  br i1 %12, label %13, label %209

; <label>:13                                      ; preds = %7
  store i32 0, i32* %b_index_x, align 4
  br label %14

; <label>:14                                      ; preds = %202, %13
  %15 = load i32* %b_index_x, align 4
  %16 = load i32* %blk, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %205

; <label>:18                                      ; preds = %14
  %19 = load i32* %blk, align 4
  %20 = sub nsw i32 %19, 1
  %21 = load i32* %b_index_x, align 4
  %22 = sub nsw i32 %20, %21
  store i32 %22, i32* %b_index_y, align 4
  store i32 0, i32* %i, align 4
  br label %23

; <label>:23                                      ; preds = %58, %18
  %24 = load i32* %i, align 4
  %25 = icmp slt i32 %24, 16
  br i1 %25, label %26, label %61

; <label>:26                                      ; preds = %23
  store i32 0, i32* %j, align 4
  br label %27

; <label>:27                                      ; preds = %54, %26
  %28 = load i32* %j, align 4
  %29 = icmp slt i32 %28, 16
  br i1 %29, label %30, label %57

; <label>:30                                      ; preds = %27
  %31 = load i32* %5, align 4
  %32 = load i32* %b_index_y, align 4
  %33 = mul nsw i32 %32, 16
  %34 = load i32* %i, align 4
  %35 = add nsw i32 %33, %34
  %36 = add nsw i32 %35, 1
  %37 = mul nsw i32 %31, %36
  %38 = load i32* %b_index_x, align 4
  %39 = mul nsw i32 %38, 16
  %40 = add nsw i32 %37, %39
  %41 = load i32* %j, align 4
  %42 = add nsw i32 %40, %41
  %43 = add nsw i32 %42, 1
  %44 = sext i32 %43 to i64
  %45 = load i32** %3, align 8
  %46 = getelementptr inbounds i32* %45, i64 %44
  %47 = load i32* %46, align 4
  %48 = load i32* %i, align 4
  %49 = mul nsw i32 %48, 16
  %50 = load i32* %j, align 4
  %51 = add nsw i32 %49, %50
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [256 x i32]* %reference_l, i32 0, i64 %52
  store i32 %47, i32* %53, align 4
  br label %54

; <label>:54                                      ; preds = %30
  %55 = load i32* %j, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %j, align 4
  br label %27

; <label>:57                                      ; preds = %27
  br label %58

; <label>:58                                      ; preds = %57
  %59 = load i32* %i, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %i, align 4
  br label %23

; <label>:61                                      ; preds = %23
  store i32 0, i32* %i1, align 4
  br label %62

; <label>:62                                      ; preds = %95, %61
  %63 = load i32* %i1, align 4
  %64 = icmp slt i32 %63, 17
  br i1 %64, label %65, label %98

; <label>:65                                      ; preds = %62
  store i32 0, i32* %j2, align 4
  br label %66

; <label>:66                                      ; preds = %91, %65
  %67 = load i32* %j2, align 4
  %68 = icmp slt i32 %67, 17
  br i1 %68, label %69, label %94

; <label>:69                                      ; preds = %66
  %70 = load i32* %5, align 4
  %71 = load i32* %b_index_y, align 4
  %72 = mul nsw i32 %71, 16
  %73 = load i32* %i1, align 4
  %74 = add nsw i32 %72, %73
  %75 = mul nsw i32 %70, %74
  %76 = load i32* %b_index_x, align 4
  %77 = mul nsw i32 %76, 16
  %78 = add nsw i32 %75, %77
  %79 = load i32* %j2, align 4
  %80 = add nsw i32 %78, %79
  %81 = sext i32 %80 to i64
  %82 = load i32** %1, align 8
  %83 = getelementptr inbounds i32* %82, i64 %81
  %84 = load i32* %83, align 4
  %85 = load i32* %i1, align 4
  %86 = mul nsw i32 %85, 17
  %87 = load i32* %j2, align 4
  %88 = add nsw i32 %86, %87
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [289 x i32]* %input_itemsets_l, i32 0, i64 %89
  store i32 %84, i32* %90, align 4
  br label %91

; <label>:91                                      ; preds = %69
  %92 = load i32* %j2, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* %j2, align 4
  br label %66

; <label>:94                                      ; preds = %66
  br label %95

; <label>:95                                      ; preds = %94
  %96 = load i32* %i1, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %i1, align 4
  br label %62

; <label>:98                                      ; preds = %62
  store i32 1, i32* %i3, align 4
  br label %99

; <label>:99                                      ; preds = %157, %98
  %100 = load i32* %i3, align 4
  %101 = icmp slt i32 %100, 17
  br i1 %101, label %102, label %160

; <label>:102                                     ; preds = %99
  store i32 1, i32* %j4, align 4
  br label %103

; <label>:103                                     ; preds = %153, %102
  %104 = load i32* %j4, align 4
  %105 = icmp slt i32 %104, 17
  br i1 %105, label %106, label %156

; <label>:106                                     ; preds = %103
  %107 = load i32* %i3, align 4
  %108 = sub nsw i32 %107, 1
  %109 = mul nsw i32 %108, 17
  %110 = load i32* %j4, align 4
  %111 = add nsw i32 %109, %110
  %112 = sub nsw i32 %111, 1
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [289 x i32]* %input_itemsets_l, i32 0, i64 %113
  %115 = load i32* %114, align 4
  %116 = load i32* %i3, align 4
  %117 = sub nsw i32 %116, 1
  %118 = mul nsw i32 %117, 16
  %119 = load i32* %j4, align 4
  %120 = add nsw i32 %118, %119
  %121 = sub nsw i32 %120, 1
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [256 x i32]* %reference_l, i32 0, i64 %122
  %124 = load i32* %123, align 4
  %125 = add nsw i32 %115, %124
  %126 = load i32* %i3, align 4
  %127 = mul nsw i32 %126, 17
  %128 = load i32* %j4, align 4
  %129 = add nsw i32 %127, %128
  %130 = sub nsw i32 %129, 1
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [289 x i32]* %input_itemsets_l, i32 0, i64 %131
  %133 = load i32* %132, align 4
  %134 = load i32* %6, align 4
  %135 = sub nsw i32 %133, %134
  %136 = load i32* %i3, align 4
  %137 = sub nsw i32 %136, 1
  %138 = mul nsw i32 %137, 17
  %139 = load i32* %j4, align 4
  %140 = add nsw i32 %138, %139
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [289 x i32]* %input_itemsets_l, i32 0, i64 %141
  %143 = load i32* %142, align 4
  %144 = load i32* %6, align 4
  %145 = sub nsw i32 %143, %144
  %146 = call i32 @_Z7maximumiii(i32 %125, i32 %135, i32 %145)
  %147 = load i32* %i3, align 4
  %148 = mul nsw i32 %147, 17
  %149 = load i32* %j4, align 4
  %150 = add nsw i32 %148, %149
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [289 x i32]* %input_itemsets_l, i32 0, i64 %151
  store i32 %146, i32* %152, align 4
  br label %153

; <label>:153                                     ; preds = %106
  %154 = load i32* %j4, align 4
  %155 = add nsw i32 %154, 1
  store i32 %155, i32* %j4, align 4
  br label %103

; <label>:156                                     ; preds = %103
  br label %157

; <label>:157                                     ; preds = %156
  %158 = load i32* %i3, align 4
  %159 = add nsw i32 %158, 1
  store i32 %159, i32* %i3, align 4
  br label %99

; <label>:160                                     ; preds = %99
  store i32 0, i32* %i5, align 4
  br label %161

; <label>:161                                     ; preds = %198, %160
  %162 = load i32* %i5, align 4
  %163 = icmp slt i32 %162, 16
  br i1 %163, label %164, label %201

; <label>:164                                     ; preds = %161
  store i32 0, i32* %j6, align 4
  br label %165

; <label>:165                                     ; preds = %194, %164
  %166 = load i32* %j6, align 4
  %167 = icmp slt i32 %166, 16
  br i1 %167, label %168, label %197

; <label>:168                                     ; preds = %165
  %169 = load i32* %i5, align 4
  %170 = add nsw i32 %169, 1
  %171 = mul nsw i32 %170, 17
  %172 = load i32* %j6, align 4
  %173 = add nsw i32 %171, %172
  %174 = add nsw i32 %173, 1
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [289 x i32]* %input_itemsets_l, i32 0, i64 %175
  %177 = load i32* %176, align 4
  %178 = load i32* %5, align 4
  %179 = load i32* %b_index_y, align 4
  %180 = mul nsw i32 %179, 16
  %181 = load i32* %i5, align 4
  %182 = add nsw i32 %180, %181
  %183 = add nsw i32 %182, 1
  %184 = mul nsw i32 %178, %183
  %185 = load i32* %b_index_x, align 4
  %186 = mul nsw i32 %185, 16
  %187 = add nsw i32 %184, %186
  %188 = load i32* %j6, align 4
  %189 = add nsw i32 %187, %188
  %190 = add nsw i32 %189, 1
  %191 = sext i32 %190 to i64
  %192 = load i32** %1, align 8
  %193 = getelementptr inbounds i32* %192, i64 %191
  store i32 %177, i32* %193, align 4
  br label %194

; <label>:194                                     ; preds = %168
  %195 = load i32* %j6, align 4
  %196 = add nsw i32 %195, 1
  store i32 %196, i32* %j6, align 4
  br label %165

; <label>:197                                     ; preds = %165
  br label %198

; <label>:198                                     ; preds = %197
  %199 = load i32* %i5, align 4
  %200 = add nsw i32 %199, 1
  store i32 %200, i32* %i5, align 4
  br label %161

; <label>:201                                     ; preds = %161
  br label %202

; <label>:202                                     ; preds = %201
  %203 = load i32* %b_index_x, align 4
  %204 = add nsw i32 %203, 1
  store i32 %204, i32* %b_index_x, align 4
  br label %14

; <label>:205                                     ; preds = %14
  br label %206

; <label>:206                                     ; preds = %205
  %207 = load i32* %blk, align 4
  %208 = add nsw i32 %207, 1
  store i32 %208, i32* %blk, align 4
  br label %7

; <label>:209                                     ; preds = %7
  %210 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str4, i32 0, i32 0))
  store i32 2, i32* %blk7, align 4
  br label %211

; <label>:211                                     ; preds = %418, %209
  %212 = load i32* %blk7, align 4
  %213 = load i32* %5, align 4
  %214 = sub nsw i32 %213, 1
  %215 = sdiv i32 %214, 16
  %216 = icmp sle i32 %212, %215
  br i1 %216, label %217, label %421

; <label>:217                                     ; preds = %211
  %218 = load i32* %blk7, align 4
  %219 = sub nsw i32 %218, 1
  store i32 %219, i32* %b_index_x8, align 4
  br label %220

; <label>:220                                     ; preds = %414, %217
  %221 = load i32* %b_index_x8, align 4
  %222 = load i32* %5, align 4
  %223 = sub nsw i32 %222, 1
  %224 = sdiv i32 %223, 16
  %225 = icmp slt i32 %221, %224
  br i1 %225, label %226, label %417

; <label>:226                                     ; preds = %220
  %227 = load i32* %5, align 4
  %228 = sub nsw i32 %227, 1
  %229 = sdiv i32 %228, 16
  %230 = load i32* %blk7, align 4
  %231 = add nsw i32 %229, %230
  %232 = sub nsw i32 %231, 2
  %233 = load i32* %b_index_x8, align 4
  %234 = sub nsw i32 %232, %233
  store i32 %234, i32* %b_index_y9, align 4
  store i32 0, i32* %i12, align 4
  br label %235

; <label>:235                                     ; preds = %270, %226
  %236 = load i32* %i12, align 4
  %237 = icmp slt i32 %236, 16
  br i1 %237, label %238, label %273

; <label>:238                                     ; preds = %235
  store i32 0, i32* %j13, align 4
  br label %239

; <label>:239                                     ; preds = %266, %238
  %240 = load i32* %j13, align 4
  %241 = icmp slt i32 %240, 16
  br i1 %241, label %242, label %269

; <label>:242                                     ; preds = %239
  %243 = load i32* %5, align 4
  %244 = load i32* %b_index_y9, align 4
  %245 = mul nsw i32 %244, 16
  %246 = load i32* %i12, align 4
  %247 = add nsw i32 %245, %246
  %248 = add nsw i32 %247, 1
  %249 = mul nsw i32 %243, %248
  %250 = load i32* %b_index_x8, align 4
  %251 = mul nsw i32 %250, 16
  %252 = add nsw i32 %249, %251
  %253 = load i32* %j13, align 4
  %254 = add nsw i32 %252, %253
  %255 = add nsw i32 %254, 1
  %256 = sext i32 %255 to i64
  %257 = load i32** %3, align 8
  %258 = getelementptr inbounds i32* %257, i64 %256
  %259 = load i32* %258, align 4
  %260 = load i32* %i12, align 4
  %261 = mul nsw i32 %260, 16
  %262 = load i32* %j13, align 4
  %263 = add nsw i32 %261, %262
  %264 = sext i32 %263 to i64
  %265 = getelementptr inbounds [256 x i32]* %reference_l11, i32 0, i64 %264
  store i32 %259, i32* %265, align 4
  br label %266

; <label>:266                                     ; preds = %242
  %267 = load i32* %j13, align 4
  %268 = add nsw i32 %267, 1
  store i32 %268, i32* %j13, align 4
  br label %239

; <label>:269                                     ; preds = %239
  br label %270

; <label>:270                                     ; preds = %269
  %271 = load i32* %i12, align 4
  %272 = add nsw i32 %271, 1
  store i32 %272, i32* %i12, align 4
  br label %235

; <label>:273                                     ; preds = %235
  store i32 0, i32* %i14, align 4
  br label %274

; <label>:274                                     ; preds = %307, %273
  %275 = load i32* %i14, align 4
  %276 = icmp slt i32 %275, 17
  br i1 %276, label %277, label %310

; <label>:277                                     ; preds = %274
  store i32 0, i32* %j15, align 4
  br label %278

; <label>:278                                     ; preds = %303, %277
  %279 = load i32* %j15, align 4
  %280 = icmp slt i32 %279, 17
  br i1 %280, label %281, label %306

; <label>:281                                     ; preds = %278
  %282 = load i32* %5, align 4
  %283 = load i32* %b_index_y9, align 4
  %284 = mul nsw i32 %283, 16
  %285 = load i32* %i14, align 4
  %286 = add nsw i32 %284, %285
  %287 = mul nsw i32 %282, %286
  %288 = load i32* %b_index_x8, align 4
  %289 = mul nsw i32 %288, 16
  %290 = add nsw i32 %287, %289
  %291 = load i32* %j15, align 4
  %292 = add nsw i32 %290, %291
  %293 = sext i32 %292 to i64
  %294 = load i32** %1, align 8
  %295 = getelementptr inbounds i32* %294, i64 %293
  %296 = load i32* %295, align 4
  %297 = load i32* %i14, align 4
  %298 = mul nsw i32 %297, 17
  %299 = load i32* %j15, align 4
  %300 = add nsw i32 %298, %299
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds [289 x i32]* %input_itemsets_l10, i32 0, i64 %301
  store i32 %296, i32* %302, align 4
  br label %303

; <label>:303                                     ; preds = %281
  %304 = load i32* %j15, align 4
  %305 = add nsw i32 %304, 1
  store i32 %305, i32* %j15, align 4
  br label %278

; <label>:306                                     ; preds = %278
  br label %307

; <label>:307                                     ; preds = %306
  %308 = load i32* %i14, align 4
  %309 = add nsw i32 %308, 1
  store i32 %309, i32* %i14, align 4
  br label %274

; <label>:310                                     ; preds = %274
  store i32 1, i32* %i16, align 4
  br label %311

; <label>:311                                     ; preds = %369, %310
  %312 = load i32* %i16, align 4
  %313 = icmp slt i32 %312, 17
  br i1 %313, label %314, label %372

; <label>:314                                     ; preds = %311
  store i32 1, i32* %j17, align 4
  br label %315

; <label>:315                                     ; preds = %365, %314
  %316 = load i32* %j17, align 4
  %317 = icmp slt i32 %316, 17
  br i1 %317, label %318, label %368

; <label>:318                                     ; preds = %315
  %319 = load i32* %i16, align 4
  %320 = sub nsw i32 %319, 1
  %321 = mul nsw i32 %320, 17
  %322 = load i32* %j17, align 4
  %323 = add nsw i32 %321, %322
  %324 = sub nsw i32 %323, 1
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds [289 x i32]* %input_itemsets_l10, i32 0, i64 %325
  %327 = load i32* %326, align 4
  %328 = load i32* %i16, align 4
  %329 = sub nsw i32 %328, 1
  %330 = mul nsw i32 %329, 16
  %331 = load i32* %j17, align 4
  %332 = add nsw i32 %330, %331
  %333 = sub nsw i32 %332, 1
  %334 = sext i32 %333 to i64
  %335 = getelementptr inbounds [256 x i32]* %reference_l11, i32 0, i64 %334
  %336 = load i32* %335, align 4
  %337 = add nsw i32 %327, %336
  %338 = load i32* %i16, align 4
  %339 = mul nsw i32 %338, 17
  %340 = load i32* %j17, align 4
  %341 = add nsw i32 %339, %340
  %342 = sub nsw i32 %341, 1
  %343 = sext i32 %342 to i64
  %344 = getelementptr inbounds [289 x i32]* %input_itemsets_l10, i32 0, i64 %343
  %345 = load i32* %344, align 4
  %346 = load i32* %6, align 4
  %347 = sub nsw i32 %345, %346
  %348 = load i32* %i16, align 4
  %349 = sub nsw i32 %348, 1
  %350 = mul nsw i32 %349, 17
  %351 = load i32* %j17, align 4
  %352 = add nsw i32 %350, %351
  %353 = sext i32 %352 to i64
  %354 = getelementptr inbounds [289 x i32]* %input_itemsets_l10, i32 0, i64 %353
  %355 = load i32* %354, align 4
  %356 = load i32* %6, align 4
  %357 = sub nsw i32 %355, %356
  %358 = call i32 @_Z7maximumiii(i32 %337, i32 %347, i32 %357)
  %359 = load i32* %i16, align 4
  %360 = mul nsw i32 %359, 17
  %361 = load i32* %j17, align 4
  %362 = add nsw i32 %360, %361
  %363 = sext i32 %362 to i64
  %364 = getelementptr inbounds [289 x i32]* %input_itemsets_l10, i32 0, i64 %363
  store i32 %358, i32* %364, align 4
  br label %365

; <label>:365                                     ; preds = %318
  %366 = load i32* %j17, align 4
  %367 = add nsw i32 %366, 1
  store i32 %367, i32* %j17, align 4
  br label %315

; <label>:368                                     ; preds = %315
  br label %369

; <label>:369                                     ; preds = %368
  %370 = load i32* %i16, align 4
  %371 = add nsw i32 %370, 1
  store i32 %371, i32* %i16, align 4
  br label %311

; <label>:372                                     ; preds = %311
  store i32 0, i32* %i18, align 4
  br label %373

; <label>:373                                     ; preds = %410, %372
  %374 = load i32* %i18, align 4
  %375 = icmp slt i32 %374, 16
  br i1 %375, label %376, label %413

; <label>:376                                     ; preds = %373
  store i32 0, i32* %j19, align 4
  br label %377

; <label>:377                                     ; preds = %406, %376
  %378 = load i32* %j19, align 4
  %379 = icmp slt i32 %378, 16
  br i1 %379, label %380, label %409

; <label>:380                                     ; preds = %377
  %381 = load i32* %i18, align 4
  %382 = add nsw i32 %381, 1
  %383 = mul nsw i32 %382, 17
  %384 = load i32* %j19, align 4
  %385 = add nsw i32 %383, %384
  %386 = add nsw i32 %385, 1
  %387 = sext i32 %386 to i64
  %388 = getelementptr inbounds [289 x i32]* %input_itemsets_l10, i32 0, i64 %387
  %389 = load i32* %388, align 4
  %390 = load i32* %5, align 4
  %391 = load i32* %b_index_y9, align 4
  %392 = mul nsw i32 %391, 16
  %393 = load i32* %i18, align 4
  %394 = add nsw i32 %392, %393
  %395 = add nsw i32 %394, 1
  %396 = mul nsw i32 %390, %395
  %397 = load i32* %b_index_x8, align 4
  %398 = mul nsw i32 %397, 16
  %399 = add nsw i32 %396, %398
  %400 = load i32* %j19, align 4
  %401 = add nsw i32 %399, %400
  %402 = add nsw i32 %401, 1
  %403 = sext i32 %402 to i64
  %404 = load i32** %1, align 8
  %405 = getelementptr inbounds i32* %404, i64 %403
  store i32 %389, i32* %405, align 4
  br label %406

; <label>:406                                     ; preds = %380
  %407 = load i32* %j19, align 4
  %408 = add nsw i32 %407, 1
  store i32 %408, i32* %j19, align 4
  br label %377

; <label>:409                                     ; preds = %377
  br label %410

; <label>:410                                     ; preds = %409
  %411 = load i32* %i18, align 4
  %412 = add nsw i32 %411, 1
  store i32 %412, i32* %i18, align 4
  br label %373

; <label>:413                                     ; preds = %373
  br label %414

; <label>:414                                     ; preds = %413
  %415 = load i32* %b_index_x8, align 4
  %416 = add nsw i32 %415, 1
  store i32 %416, i32* %b_index_x8, align 4
  br label %220

; <label>:417                                     ; preds = %220
  br label %418

; <label>:418                                     ; preds = %417
  %419 = load i32* %blk7, align 4
  %420 = add nsw i32 %419, 1
  store i32 %420, i32* %blk7, align 4
  br label %211

; <label>:421                                     ; preds = %211
  ret void
}

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #5

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @srand(i32) #1

; Function Attrs: nounwind
declare i32 @rand() #1

declare %struct._IO_FILE* @fopen(i8*, i8*) #3

declare i32 @fclose(%struct._IO_FILE*) #3

; Function Attrs: nounwind
declare void @free(i8*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }
attributes #8 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
