; ModuleID = 'pathfinder.cpp'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@rows = global i32 0, align 4
@cols = global i32 0, align 4
@data = global i32* null, align 8
@wall = global i32** null, align 8
@result = global i32* null, align 8
@.str = private unnamed_addr constant [37 x i8] c"Usage: pathfiner width num_of_steps\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@stderr = external global %struct._IO_FILE*
@.str3 = private unnamed_addr constant [11 x i8] c"error: %s\0A\00", align 1

; Function Attrs: uwtable
define void @_Z4initiPPc(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %j1 = alloca i32, align 4
  %i2 = alloca i32, align 4
  %j3 = alloca i32, align 4
  store i32 %argc, i32* %1, align 4
  store i8** %argv, i8*** %2, align 8
  %3 = load i32* %1, align 4
  %4 = icmp eq i32 %3, 3
  br i1 %4, label %5, label %14

; <label>:5                                       ; preds = %0
  %6 = load i8*** %2, align 8
  %7 = getelementptr inbounds i8** %6, i64 1
  %8 = load i8** %7, align 8
  %9 = call i32 @atoi(i8* %8) #8
  store i32 %9, i32* @cols, align 4
  %10 = load i8*** %2, align 8
  %11 = getelementptr inbounds i8** %10, i64 2
  %12 = load i8** %11, align 8
  %13 = call i32 @atoi(i8* %12) #8
  store i32 %13, i32* @rows, align 4
  br label %16

; <label>:14                                      ; preds = %0
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 0) #9
  unreachable

; <label>:16                                      ; preds = %5
  %17 = load i32* @rows, align 4
  %18 = load i32* @cols, align 4
  %19 = mul nsw i32 %17, %18
  %20 = sext i32 %19 to i64
  %21 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %20, i64 4)
  %22 = extractvalue { i64, i1 } %21, 1
  %23 = extractvalue { i64, i1 } %21, 0
  %24 = select i1 %22, i64 -1, i64 %23
  %25 = call noalias i8* @_Znam(i64 %24) #10
  %26 = bitcast i8* %25 to i32*
  store i32* %26, i32** @data, align 8
  %27 = load i32* @rows, align 4
  %28 = sext i32 %27 to i64
  %29 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %28, i64 8)
  %30 = extractvalue { i64, i1 } %29, 1
  %31 = extractvalue { i64, i1 } %29, 0
  %32 = select i1 %30, i64 -1, i64 %31
  %33 = call noalias i8* @_Znam(i64 %32) #10
  %34 = bitcast i8* %33 to i32**
  store i32** %34, i32*** @wall, align 8
  store i32 0, i32* %n, align 4
  br label %35

; <label>:35                                      ; preds = %50, %16
  %36 = load i32* %n, align 4
  %37 = load i32* @rows, align 4
  %38 = icmp slt i32 %36, %37
  br i1 %38, label %39, label %53

; <label>:39                                      ; preds = %35
  %40 = load i32** @data, align 8
  %41 = load i32* @cols, align 4
  %42 = load i32* %n, align 4
  %43 = mul nsw i32 %41, %42
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32* %40, i64 %44
  %46 = load i32* %n, align 4
  %47 = sext i32 %46 to i64
  %48 = load i32*** @wall, align 8
  %49 = getelementptr inbounds i32** %48, i64 %47
  store i32* %45, i32** %49, align 8
  br label %50

; <label>:50                                      ; preds = %39
  %51 = load i32* %n, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %n, align 4
  br label %35

; <label>:53                                      ; preds = %35
  %54 = load i32* @cols, align 4
  %55 = sext i32 %54 to i64
  %56 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %55, i64 4)
  %57 = extractvalue { i64, i1 } %56, 1
  %58 = extractvalue { i64, i1 } %56, 0
  %59 = select i1 %57, i64 -1, i64 %58
  %60 = call noalias i8* @_Znam(i64 %59) #10
  %61 = bitcast i8* %60 to i32*
  store i32* %61, i32** @result, align 8
  call void @srand(i32 10) #11
  store i32 0, i32* %i, align 4
  br label %62

; <label>:62                                      ; preds = %86, %53
  %63 = load i32* %i, align 4
  %64 = load i32* @rows, align 4
  %65 = icmp slt i32 %63, %64
  br i1 %65, label %66, label %89

; <label>:66                                      ; preds = %62
  store i32 0, i32* %j, align 4
  br label %67

; <label>:67                                      ; preds = %82, %66
  %68 = load i32* %j, align 4
  %69 = load i32* @cols, align 4
  %70 = icmp slt i32 %68, %69
  br i1 %70, label %71, label %85

; <label>:71                                      ; preds = %67
  %72 = call i32 @rand() #11
  %73 = srem i32 %72, 10
  %74 = load i32* %j, align 4
  %75 = sext i32 %74 to i64
  %76 = load i32* %i, align 4
  %77 = sext i32 %76 to i64
  %78 = load i32*** @wall, align 8
  %79 = getelementptr inbounds i32** %78, i64 %77
  %80 = load i32** %79, align 8
  %81 = getelementptr inbounds i32* %80, i64 %75
  store i32 %73, i32* %81, align 4
  br label %82

; <label>:82                                      ; preds = %71
  %83 = load i32* %j, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* %j, align 4
  br label %67

; <label>:85                                      ; preds = %67
  br label %86

; <label>:86                                      ; preds = %85
  %87 = load i32* %i, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %i, align 4
  br label %62

; <label>:89                                      ; preds = %62
  store i32 0, i32* %j1, align 4
  br label %90

; <label>:90                                      ; preds = %106, %89
  %91 = load i32* %j1, align 4
  %92 = load i32* @cols, align 4
  %93 = icmp slt i32 %91, %92
  br i1 %93, label %94, label %109

; <label>:94                                      ; preds = %90
  %95 = load i32* %j1, align 4
  %96 = sext i32 %95 to i64
  %97 = load i32*** @wall, align 8
  %98 = getelementptr inbounds i32** %97, i64 0
  %99 = load i32** %98, align 8
  %100 = getelementptr inbounds i32* %99, i64 %96
  %101 = load i32* %100, align 4
  %102 = load i32* %j1, align 4
  %103 = sext i32 %102 to i64
  %104 = load i32** @result, align 8
  %105 = getelementptr inbounds i32* %104, i64 %103
  store i32 %101, i32* %105, align 4
  br label %106

; <label>:106                                     ; preds = %94
  %107 = load i32* %j1, align 4
  %108 = add nsw i32 %107, 1
  store i32 %108, i32* %j1, align 4
  br label %90

; <label>:109                                     ; preds = %90
  store i32 0, i32* %i2, align 4
  br label %110

; <label>:110                                     ; preds = %135, %109
  %111 = load i32* %i2, align 4
  %112 = load i32* @rows, align 4
  %113 = icmp slt i32 %111, %112
  br i1 %113, label %114, label %138

; <label>:114                                     ; preds = %110
  store i32 0, i32* %j3, align 4
  br label %115

; <label>:115                                     ; preds = %130, %114
  %116 = load i32* %j3, align 4
  %117 = load i32* @cols, align 4
  %118 = icmp slt i32 %116, %117
  br i1 %118, label %119, label %133

; <label>:119                                     ; preds = %115
  %120 = load i32* %j3, align 4
  %121 = sext i32 %120 to i64
  %122 = load i32* %i2, align 4
  %123 = sext i32 %122 to i64
  %124 = load i32*** @wall, align 8
  %125 = getelementptr inbounds i32** %124, i64 %123
  %126 = load i32** %125, align 8
  %127 = getelementptr inbounds i32* %126, i64 %121
  %128 = load i32* %127, align 4
  %129 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %128)
  br label %130

; <label>:130                                     ; preds = %119
  %131 = load i32* %j3, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, i32* %j3, align 4
  br label %115

; <label>:133                                     ; preds = %115
  %134 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  br label %135

; <label>:135                                     ; preds = %133
  %136 = load i32* %i2, align 4
  %137 = add nsw i32 %136, 1
  store i32 %137, i32* %i2, align 4
  br label %110

; <label>:138                                     ; preds = %110
  ret void
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #4

; Function Attrs: nobuiltin
declare noalias i8* @_Znam(i64) #5

; Function Attrs: nounwind
declare void @srand(i32) #6

; Function Attrs: nounwind
declare i32 @rand() #6

; Function Attrs: uwtable
define void @_Z5fatalPc(i8* %s) #0 {
  %1 = alloca i8*, align 8
  store i8* %s, i8** %1, align 8
  %2 = load %struct._IO_FILE** @stderr, align 8
  %3 = load i8** %1, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), i8* %3)
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i32* %2, align 4
  %5 = load i8*** %3, align 8
  call void @_Z4initiPPc(i32 %4, i8** %5)
  %6 = load i32* %2, align 4
  %7 = load i8*** %3, align 8
  call void @_Z3runiPPc(i32 %6, i8** %7)
  ret i32 0
}

; Function Attrs: uwtable
define void @_Z3runiPPc(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8**, align 8
  %cycles = alloca i64, align 8
  %src = alloca i32*, align 8
  %dst = alloca i32*, align 8
  %temp = alloca i32*, align 8
  %min = alloca i32, align 4
  %t = alloca i32, align 4
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  store i32 %argc, i32* %1, align 4
  store i8** %argv, i8*** %2, align 8
  %3 = load i32** @result, align 8
  store i32* %3, i32** %dst, align 8
  %4 = load i32* @cols, align 4
  %5 = sext i32 %4 to i64
  %6 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %5, i64 4)
  %7 = extractvalue { i64, i1 } %6, 1
  %8 = extractvalue { i64, i1 } %6, 0
  %9 = select i1 %7, i64 -1, i64 %8
  %10 = call noalias i8* @_Znam(i64 %9) #10
  %11 = bitcast i8* %10 to i32*
  store i32* %11, i32** %src, align 8
  store i32 0, i32* %t, align 4
  br label %12

; <label>:12                                      ; preds = %99, %0
  %13 = load i32* %t, align 4
  %14 = load i32* @rows, align 4
  %15 = sub nsw i32 %14, 1
  %16 = icmp slt i32 %13, %15
  br i1 %16, label %17, label %102

; <label>:17                                      ; preds = %12
  %18 = load i32** %src, align 8
  store i32* %18, i32** %temp, align 8
  %19 = load i32** %dst, align 8
  store i32* %19, i32** %src, align 8
  %20 = load i32** %temp, align 8
  store i32* %20, i32** %dst, align 8
  store i32 0, i32* %n, align 4
  br label %21

; <label>:21                                      ; preds = %95, %17
  %22 = load i32* %n, align 4
  %23 = load i32* @cols, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %98

; <label>:25                                      ; preds = %21
  %26 = load i32* %n, align 4
  %27 = sext i32 %26 to i64
  %28 = load i32** %src, align 8
  %29 = getelementptr inbounds i32* %28, i64 %27
  %30 = load i32* %29, align 4
  store i32 %30, i32* %min, align 4
  %31 = load i32* %n, align 4
  %32 = icmp sgt i32 %31, 0
  br i1 %32, label %33, label %53

; <label>:33                                      ; preds = %25
  %34 = load i32* %min, align 4
  %35 = load i32* %n, align 4
  %36 = sub nsw i32 %35, 1
  %37 = sext i32 %36 to i64
  %38 = load i32** %src, align 8
  %39 = getelementptr inbounds i32* %38, i64 %37
  %40 = load i32* %39, align 4
  %41 = icmp sle i32 %34, %40
  br i1 %41, label %42, label %44

; <label>:42                                      ; preds = %33
  %43 = load i32* %min, align 4
  br label %51

; <label>:44                                      ; preds = %33
  %45 = load i32* %n, align 4
  %46 = sub nsw i32 %45, 1
  %47 = sext i32 %46 to i64
  %48 = load i32** %src, align 8
  %49 = getelementptr inbounds i32* %48, i64 %47
  %50 = load i32* %49, align 4
  br label %51

; <label>:51                                      ; preds = %44, %42
  %52 = phi i32 [ %43, %42 ], [ %50, %44 ]
  store i32 %52, i32* %min, align 4
  br label %53

; <label>:53                                      ; preds = %51, %25
  %54 = load i32* %n, align 4
  %55 = load i32* @cols, align 4
  %56 = sub nsw i32 %55, 1
  %57 = icmp slt i32 %54, %56
  br i1 %57, label %58, label %78

; <label>:58                                      ; preds = %53
  %59 = load i32* %min, align 4
  %60 = load i32* %n, align 4
  %61 = add nsw i32 %60, 1
  %62 = sext i32 %61 to i64
  %63 = load i32** %src, align 8
  %64 = getelementptr inbounds i32* %63, i64 %62
  %65 = load i32* %64, align 4
  %66 = icmp sle i32 %59, %65
  br i1 %66, label %67, label %69

; <label>:67                                      ; preds = %58
  %68 = load i32* %min, align 4
  br label %76

; <label>:69                                      ; preds = %58
  %70 = load i32* %n, align 4
  %71 = add nsw i32 %70, 1
  %72 = sext i32 %71 to i64
  %73 = load i32** %src, align 8
  %74 = getelementptr inbounds i32* %73, i64 %72
  %75 = load i32* %74, align 4
  br label %76

; <label>:76                                      ; preds = %69, %67
  %77 = phi i32 [ %68, %67 ], [ %75, %69 ]
  store i32 %77, i32* %min, align 4
  br label %78

; <label>:78                                      ; preds = %76, %53
  %79 = load i32* %n, align 4
  %80 = sext i32 %79 to i64
  %81 = load i32* %t, align 4
  %82 = add nsw i32 %81, 1
  %83 = sext i32 %82 to i64
  %84 = load i32*** @wall, align 8
  %85 = getelementptr inbounds i32** %84, i64 %83
  %86 = load i32** %85, align 8
  %87 = getelementptr inbounds i32* %86, i64 %80
  %88 = load i32* %87, align 4
  %89 = load i32* %min, align 4
  %90 = add nsw i32 %88, %89
  %91 = load i32* %n, align 4
  %92 = sext i32 %91 to i64
  %93 = load i32** %dst, align 8
  %94 = getelementptr inbounds i32* %93, i64 %92
  store i32 %90, i32* %94, align 4
  br label %95

; <label>:95                                      ; preds = %78
  %96 = load i32* %n, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %n, align 4
  br label %21

; <label>:98                                      ; preds = %21
  br label %99

; <label>:99                                      ; preds = %98
  %100 = load i32* %t, align 4
  %101 = add nsw i32 %100, 1
  store i32 %101, i32* %t, align 4
  br label %12

; <label>:102                                     ; preds = %12
  store i32 0, i32* %i, align 4
  br label %103

; <label>:103                                     ; preds = %114, %102
  %104 = load i32* %i, align 4
  %105 = load i32* @cols, align 4
  %106 = icmp slt i32 %104, %105
  br i1 %106, label %107, label %117

; <label>:107                                     ; preds = %103
  %108 = load i32* %i, align 4
  %109 = sext i32 %108 to i64
  %110 = load i32** @data, align 8
  %111 = getelementptr inbounds i32* %110, i64 %109
  %112 = load i32* %111, align 4
  %113 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %112)
  br label %114

; <label>:114                                     ; preds = %107
  %115 = load i32* %i, align 4
  %116 = add nsw i32 %115, 1
  store i32 %116, i32* %i, align 4
  br label %103

; <label>:117                                     ; preds = %103
  %118 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  store i32 0, i32* %i1, align 4
  br label %119

; <label>:119                                     ; preds = %130, %117
  %120 = load i32* %i1, align 4
  %121 = load i32* @cols, align 4
  %122 = icmp slt i32 %120, %121
  br i1 %122, label %123, label %133

; <label>:123                                     ; preds = %119
  %124 = load i32* %i1, align 4
  %125 = sext i32 %124 to i64
  %126 = load i32** %dst, align 8
  %127 = getelementptr inbounds i32* %126, i64 %125
  %128 = load i32* %127, align 4
  %129 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %128)
  br label %130

; <label>:130                                     ; preds = %123
  %131 = load i32* %i1, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, i32* %i1, align 4
  br label %119

; <label>:133                                     ; preds = %119
  %134 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  %135 = load i32** @data, align 8
  %136 = icmp eq i32* %135, null
  br i1 %136, label %139, label %137

; <label>:137                                     ; preds = %133
  %138 = bitcast i32* %135 to i8*
  call void @_ZdaPv(i8* %138) #12
  br label %139

; <label>:139                                     ; preds = %137, %133
  %140 = load i32*** @wall, align 8
  %141 = icmp eq i32** %140, null
  br i1 %141, label %144, label %142

; <label>:142                                     ; preds = %139
  %143 = bitcast i32** %140 to i8*
  call void @_ZdaPv(i8* %143) #12
  br label %144

; <label>:144                                     ; preds = %142, %139
  %145 = load i32** %dst, align 8
  %146 = icmp eq i32* %145, null
  br i1 %146, label %149, label %147

; <label>:147                                     ; preds = %144
  %148 = bitcast i32* %145 to i8*
  call void @_ZdaPv(i8* %148) #12
  br label %149

; <label>:149                                     ; preds = %147, %144
  %150 = load i32** %src, align 8
  %151 = icmp eq i32* %150, null
  br i1 %151, label %154, label %152

; <label>:152                                     ; preds = %149
  %153 = bitcast i32* %150 to i8*
  call void @_ZdaPv(i8* %153) #12
  br label %154

; <label>:154                                     ; preds = %152, %149
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(i8*) #7

attributes #0 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nobuiltin "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nobuiltin nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind readonly }
attributes #9 = { noreturn nounwind }
attributes #10 = { builtin }
attributes #11 = { nounwind }
attributes #12 = { builtin nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
