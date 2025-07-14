; ModuleID = 'temp-unreadable.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [15 x i8] c"SDC DETECTED!\0A\00", align 1
@rows = global i32 0, align 4
@cols = global i32 0, align 4
@data = global i32* null, align 8
@wall = global i32** null, align 8
@result = global i32* null, align 8
@.str1 = private unnamed_addr constant [37 x i8] c"Usage: pathfiner width num_of_steps\0A\00", align 1
@.str12 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@stderr = external global %struct._IO_FILE*
@.str3 = private unnamed_addr constant [11 x i8] c"error: %s\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @check_flag() #0 {
  %1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 99) #9
  unreachable
                                                  ; No predecessors!
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: uwtable
define void @_Z4initiPPc(i32 %argc, i8** %argv) #3 {
  %1 = alloca i32, align 4, !llfi_index !1
  %2 = alloca i8**, align 8, !llfi_index !2
  %n = alloca i32, align 4, !llfi_index !3
  %i = alloca i32, align 4, !llfi_index !4
  %j = alloca i32, align 4, !llfi_index !5
  %j1 = alloca i32, align 4, !llfi_index !6
  %i2 = alloca i32, align 4, !llfi_index !7
  %j3 = alloca i32, align 4, !llfi_index !8
  store i32 %argc, i32* %1, align 4, !llfi_index !9
  store i8** %argv, i8*** %2, align 8, !llfi_index !10
  %3 = load i32* %1, align 4, !llfi_index !11
  %4 = load i32* %1, align 4, !llfi_index !11
  %5 = icmp eq i32 %3, 3, !llfi_index !12
  %6 = icmp eq i32 %4, 3, !llfi_index !12
  %check_cmp = icmp eq i1 %5, %6
  br i1 %check_cmp, label %7, label %checkBb

checkBb:                                          ; preds = %0
  call void @check_flag()
  br label %7

; <label>:7                                       ; preds = %checkBb, %0
  br i1 %5, label %8, label %25, !llfi_index !13

; <label>:8                                       ; preds = %7
  %9 = load i8*** %2, align 8, !llfi_index !14
  %10 = load i8*** %2, align 8, !llfi_index !14
  %11 = getelementptr inbounds i8** %9, i64 1, !llfi_index !15
  %12 = getelementptr inbounds i8** %10, i64 1, !llfi_index !15
  %13 = load i8** %11, align 8, !llfi_index !16
  %14 = load i8** %12, align 8, !llfi_index !16
  %check_cmp1 = icmp eq i8* %13, %14
  br i1 %check_cmp1, label %15, label %checkBb2

checkBb2:                                         ; preds = %8
  call void @check_flag()
  br label %15

; <label>:15                                      ; preds = %checkBb2, %8
  %16 = call i32 @atoi(i8* %13) #10, !llfi_index !17
  store i32 %16, i32* @cols, align 4, !llfi_index !18
  %17 = load i8*** %2, align 8, !llfi_index !19
  %18 = load i8*** %2, align 8, !llfi_index !19
  %19 = getelementptr inbounds i8** %17, i64 2, !llfi_index !20
  %20 = getelementptr inbounds i8** %18, i64 2, !llfi_index !20
  %21 = load i8** %19, align 8, !llfi_index !21
  %22 = load i8** %20, align 8, !llfi_index !21
  %check_cmp3 = icmp eq i8* %21, %22
  br i1 %check_cmp3, label %23, label %checkBb4

checkBb4:                                         ; preds = %15
  call void @check_flag()
  br label %23

; <label>:23                                      ; preds = %checkBb4, %15
  %24 = call i32 @atoi(i8* %21) #10, !llfi_index !22
  store i32 %24, i32* @rows, align 4, !llfi_index !23
  br label %27, !llfi_index !24

; <label>:25                                      ; preds = %7
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str1, i32 0, i32 0)), !llfi_index !25
  call void @exit(i32 0) #9, !llfi_index !26
  unreachable, !llfi_index !27

; <label>:27                                      ; preds = %23
  %28 = load i32* @rows, align 4, !llfi_index !28
  %29 = load i32* @cols, align 4, !llfi_index !29
  %30 = mul nsw i32 %28, %29, !llfi_index !30
  %31 = sext i32 %30 to i64, !llfi_index !31
  %32 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %31, i64 4), !llfi_index !32
  %33 = extractvalue { i64, i1 } %32, 1, !llfi_index !33
  %34 = extractvalue { i64, i1 } %32, 0, !llfi_index !34
  %35 = select i1 %33, i64 -1, i64 %34, !llfi_index !35
  %36 = call noalias i8* @_Znam(i64 %35) #11, !llfi_index !36
  %37 = bitcast i8* %36 to i32*, !llfi_index !37
  store i32* %37, i32** @data, align 8, !llfi_index !38
  %38 = load i32* @rows, align 4, !llfi_index !39
  %39 = sext i32 %38 to i64, !llfi_index !40
  %40 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %39, i64 8), !llfi_index !41
  %41 = extractvalue { i64, i1 } %40, 1, !llfi_index !42
  %42 = extractvalue { i64, i1 } %40, 0, !llfi_index !43
  %43 = select i1 %41, i64 -1, i64 %42, !llfi_index !44
  %44 = call noalias i8* @_Znam(i64 %43) #11, !llfi_index !45
  %45 = bitcast i8* %44 to i32**, !llfi_index !46
  store i32** %45, i32*** @wall, align 8, !llfi_index !47
  store i32 0, i32* %n, align 4, !llfi_index !48
  br label %46, !llfi_index !49

; <label>:46                                      ; preds = %68, %27
  %47 = load i32* %n, align 4, !llfi_index !50
  %48 = load i32* @rows, align 4, !llfi_index !51
  %49 = icmp slt i32 %47, %48, !llfi_index !52
  br i1 %49, label %50, label %71, !llfi_index !53

; <label>:50                                      ; preds = %46
  %51 = load i32** @data, align 8, !llfi_index !54
  %52 = load i32** @data, align 8, !llfi_index !54
  %53 = load i32* @cols, align 4, !llfi_index !55
  %54 = load i32* @cols, align 4, !llfi_index !55
  %55 = load i32* %n, align 4, !llfi_index !56
  %56 = load i32* %n, align 4, !llfi_index !56
  %57 = mul nsw i32 %53, %55, !llfi_index !57
  %58 = mul nsw i32 %54, %56, !llfi_index !57
  %59 = sext i32 %57 to i64, !llfi_index !58
  %60 = sext i32 %58 to i64, !llfi_index !58
  %61 = getelementptr inbounds i32* %51, i64 %59, !llfi_index !59
  %62 = getelementptr inbounds i32* %52, i64 %60, !llfi_index !59
  %check_cmp5 = icmp eq i32* %61, %62
  br i1 %check_cmp5, label %63, label %checkBb6

checkBb6:                                         ; preds = %50
  call void @check_flag()
  br label %63

; <label>:63                                      ; preds = %checkBb6, %50
  %64 = load i32* %n, align 4, !llfi_index !60
  %65 = sext i32 %64 to i64, !llfi_index !61
  %66 = load i32*** @wall, align 8, !llfi_index !62
  %67 = getelementptr inbounds i32** %66, i64 %65, !llfi_index !63
  store i32* %61, i32** %67, align 8, !llfi_index !64
  br label %68, !llfi_index !65

; <label>:68                                      ; preds = %63
  %69 = load i32* %n, align 4, !llfi_index !66
  %70 = add nsw i32 %69, 1, !llfi_index !67
  store i32 %70, i32* %n, align 4, !llfi_index !68
  br label %46, !llfi_index !69

; <label>:71                                      ; preds = %46
  %72 = load i32* @cols, align 4, !llfi_index !70
  %73 = sext i32 %72 to i64, !llfi_index !71
  %74 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %73, i64 4), !llfi_index !72
  %75 = extractvalue { i64, i1 } %74, 1, !llfi_index !73
  %76 = extractvalue { i64, i1 } %74, 0, !llfi_index !74
  %77 = select i1 %75, i64 -1, i64 %76, !llfi_index !75
  %78 = call noalias i8* @_Znam(i64 %77) #11, !llfi_index !76
  %79 = bitcast i8* %78 to i32*, !llfi_index !77
  store i32* %79, i32** @result, align 8, !llfi_index !78
  call void @srand(i32 10) #12, !llfi_index !79
  store i32 0, i32* %i, align 4, !llfi_index !80
  br label %80, !llfi_index !81

; <label>:80                                      ; preds = %131, %71
  %81 = load i32* %i, align 4, !llfi_index !82
  %82 = load i32* %i, align 4, !llfi_index !82
  %83 = load i32* @rows, align 4, !llfi_index !83
  %84 = load i32* @rows, align 4, !llfi_index !83
  %85 = icmp slt i32 %81, %83, !llfi_index !84
  %86 = icmp slt i32 %82, %84, !llfi_index !84
  %check_cmp7 = icmp eq i1 %85, %86
  br i1 %check_cmp7, label %87, label %checkBb8

checkBb8:                                         ; preds = %80
  call void @check_flag()
  br label %87

; <label>:87                                      ; preds = %checkBb8, %80
  br i1 %85, label %88, label %132, !llfi_index !85

; <label>:88                                      ; preds = %87
  store i32 0, i32* %j, align 4, !llfi_index !86
  br label %89, !llfi_index !87

; <label>:89                                      ; preds = %124, %88
  %90 = load i32* %j, align 4, !llfi_index !88
  %91 = load i32* %j, align 4, !llfi_index !88
  %92 = load i32* @cols, align 4, !llfi_index !89
  %93 = load i32* @cols, align 4, !llfi_index !89
  %94 = icmp slt i32 %90, %92, !llfi_index !90
  %95 = icmp slt i32 %91, %93, !llfi_index !90
  %check_cmp9 = icmp eq i1 %94, %95
  br i1 %check_cmp9, label %96, label %checkBb10

checkBb10:                                        ; preds = %89
  call void @check_flag()
  br label %96

; <label>:96                                      ; preds = %checkBb10, %89
  br i1 %94, label %97, label %125, !llfi_index !91

; <label>:97                                      ; preds = %96
  %98 = call i32 @rand() #12, !llfi_index !92
  %99 = srem i32 %98, 10, !llfi_index !93
  %100 = srem i32 %98, 10, !llfi_index !93
  %check_cmp11 = icmp eq i32 %99, %100
  br i1 %check_cmp11, label %101, label %checkBb12

checkBb12:                                        ; preds = %97
  call void @check_flag()
  br label %101

; <label>:101                                     ; preds = %checkBb12, %97
  %102 = load i32* %j, align 4, !llfi_index !94
  %103 = load i32* %j, align 4, !llfi_index !94
  %104 = sext i32 %102 to i64, !llfi_index !95
  %105 = sext i32 %103 to i64, !llfi_index !95
  %106 = load i32* %i, align 4, !llfi_index !96
  %107 = load i32* %i, align 4, !llfi_index !96
  %108 = sext i32 %106 to i64, !llfi_index !97
  %109 = sext i32 %107 to i64, !llfi_index !97
  %110 = load i32*** @wall, align 8, !llfi_index !98
  %111 = load i32*** @wall, align 8, !llfi_index !98
  %112 = getelementptr inbounds i32** %110, i64 %108, !llfi_index !99
  %113 = getelementptr inbounds i32** %111, i64 %109, !llfi_index !99
  %114 = load i32** %112, align 8, !llfi_index !100
  %115 = load i32** %113, align 8, !llfi_index !100
  %116 = getelementptr inbounds i32* %114, i64 %104, !llfi_index !101
  %117 = getelementptr inbounds i32* %115, i64 %105, !llfi_index !101
  %check_cmp13 = icmp eq i32* %116, %117
  br i1 %check_cmp13, label %118, label %checkBb14

checkBb14:                                        ; preds = %101
  call void @check_flag()
  br label %118

; <label>:118                                     ; preds = %checkBb14, %101
  store i32 %99, i32* %116, align 4, !llfi_index !102
  br label %119, !llfi_index !103

; <label>:119                                     ; preds = %118
  %120 = load i32* %j, align 4, !llfi_index !104
  %121 = load i32* %j, align 4, !llfi_index !104
  %122 = add nsw i32 %120, 1, !llfi_index !105
  %123 = add nsw i32 %121, 1, !llfi_index !105
  %check_cmp15 = icmp eq i32 %122, %123
  br i1 %check_cmp15, label %124, label %checkBb16

checkBb16:                                        ; preds = %119
  call void @check_flag()
  br label %124

; <label>:124                                     ; preds = %checkBb16, %119
  store i32 %122, i32* %j, align 4, !llfi_index !106
  br label %89, !llfi_index !107

; <label>:125                                     ; preds = %96
  br label %126, !llfi_index !108

; <label>:126                                     ; preds = %125
  %127 = load i32* %i, align 4, !llfi_index !109
  %128 = load i32* %i, align 4, !llfi_index !109
  %129 = add nsw i32 %127, 1, !llfi_index !110
  %130 = add nsw i32 %128, 1, !llfi_index !110
  %check_cmp17 = icmp eq i32 %129, %130
  br i1 %check_cmp17, label %131, label %checkBb18

checkBb18:                                        ; preds = %126
  call void @check_flag()
  br label %131

; <label>:131                                     ; preds = %checkBb18, %126
  store i32 %129, i32* %i, align 4, !llfi_index !111
  br label %80, !llfi_index !112

; <label>:132                                     ; preds = %87
  store i32 0, i32* %j1, align 4, !llfi_index !113
  br label %133, !llfi_index !114

; <label>:133                                     ; preds = %168, %132
  %134 = load i32* %j1, align 4, !llfi_index !115
  %135 = load i32* %j1, align 4, !llfi_index !115
  %136 = load i32* @cols, align 4, !llfi_index !116
  %137 = icmp slt i32 %134, %136, !llfi_index !117
  %138 = icmp slt i32 %135, %136, !llfi_index !117
  %check_cmp19 = icmp eq i1 %137, %138
  br i1 %check_cmp19, label %139, label %checkBb20

checkBb20:                                        ; preds = %133
  call void @check_flag()
  br label %139

; <label>:139                                     ; preds = %checkBb20, %133
  br i1 %137, label %140, label %169, !llfi_index !118

; <label>:140                                     ; preds = %139
  %141 = load i32* %j1, align 4, !llfi_index !119
  %142 = load i32* %j1, align 4, !llfi_index !119
  %143 = sext i32 %141 to i64, !llfi_index !120
  %144 = sext i32 %142 to i64, !llfi_index !120
  %145 = load i32*** @wall, align 8, !llfi_index !121
  %146 = getelementptr inbounds i32** %145, i64 0, !llfi_index !122
  %147 = load i32** %146, align 8, !llfi_index !123
  %148 = load i32** %146, align 8, !llfi_index !123
  %149 = getelementptr inbounds i32* %147, i64 %143, !llfi_index !124
  %150 = getelementptr inbounds i32* %148, i64 %144, !llfi_index !124
  %151 = load i32* %149, align 4, !llfi_index !125
  %152 = load i32* %150, align 4, !llfi_index !125
  %check_cmp21 = icmp eq i32 %151, %152
  br i1 %check_cmp21, label %153, label %checkBb22

checkBb22:                                        ; preds = %140
  call void @check_flag()
  br label %153

; <label>:153                                     ; preds = %checkBb22, %140
  %154 = load i32* %j1, align 4, !llfi_index !126
  %155 = load i32* %j1, align 4, !llfi_index !126
  %156 = sext i32 %154 to i64, !llfi_index !127
  %157 = sext i32 %155 to i64, !llfi_index !127
  %158 = load i32** @result, align 8, !llfi_index !128
  %159 = load i32** @result, align 8, !llfi_index !128
  %160 = getelementptr inbounds i32* %158, i64 %156, !llfi_index !129
  %161 = getelementptr inbounds i32* %159, i64 %157, !llfi_index !129
  %check_cmp23 = icmp eq i32* %160, %161
  br i1 %check_cmp23, label %162, label %checkBb24

checkBb24:                                        ; preds = %153
  call void @check_flag()
  br label %162

; <label>:162                                     ; preds = %checkBb24, %153
  store i32 %151, i32* %160, align 4, !llfi_index !130
  br label %163, !llfi_index !131

; <label>:163                                     ; preds = %162
  %164 = load i32* %j1, align 4, !llfi_index !132
  %165 = load i32* %j1, align 4, !llfi_index !132
  %166 = add nsw i32 %164, 1, !llfi_index !133
  %167 = add nsw i32 %165, 1, !llfi_index !133
  %check_cmp25 = icmp eq i32 %166, %167
  br i1 %check_cmp25, label %168, label %checkBb26

checkBb26:                                        ; preds = %163
  call void @check_flag()
  br label %168

; <label>:168                                     ; preds = %checkBb26, %163
  store i32 %166, i32* %j1, align 4, !llfi_index !134
  br label %133, !llfi_index !135

; <label>:169                                     ; preds = %139
  store i32 0, i32* %i2, align 4, !llfi_index !136
  br label %170, !llfi_index !137

; <label>:170                                     ; preds = %220, %169
  %171 = load i32* %i2, align 4, !llfi_index !138
  %172 = load i32* %i2, align 4, !llfi_index !138
  %173 = load i32* @rows, align 4, !llfi_index !139
  %174 = icmp slt i32 %171, %173, !llfi_index !140
  %175 = icmp slt i32 %172, %173, !llfi_index !140
  %check_cmp27 = icmp eq i1 %174, %175
  br i1 %check_cmp27, label %176, label %checkBb28

checkBb28:                                        ; preds = %170
  call void @check_flag()
  br label %176

; <label>:176                                     ; preds = %checkBb28, %170
  br i1 %174, label %177, label %221, !llfi_index !141

; <label>:177                                     ; preds = %176
  store i32 0, i32* %j3, align 4, !llfi_index !142
  br label %178, !llfi_index !143

; <label>:178                                     ; preds = %212, %177
  %179 = load i32* %j3, align 4, !llfi_index !144
  %180 = load i32* %j3, align 4, !llfi_index !144
  %181 = load i32* @cols, align 4, !llfi_index !145
  %182 = load i32* @cols, align 4, !llfi_index !145
  %183 = icmp slt i32 %179, %181, !llfi_index !146
  %184 = icmp slt i32 %180, %182, !llfi_index !146
  %check_cmp29 = icmp eq i1 %183, %184
  br i1 %check_cmp29, label %185, label %checkBb30

checkBb30:                                        ; preds = %178
  call void @check_flag()
  br label %185

; <label>:185                                     ; preds = %checkBb30, %178
  br i1 %183, label %186, label %213, !llfi_index !147

; <label>:186                                     ; preds = %185
  %187 = load i32* %j3, align 4, !llfi_index !148
  %188 = load i32* %j3, align 4, !llfi_index !148
  %189 = sext i32 %187 to i64, !llfi_index !149
  %190 = sext i32 %188 to i64, !llfi_index !149
  %191 = load i32* %i2, align 4, !llfi_index !150
  %192 = load i32* %i2, align 4, !llfi_index !150
  %check_cmp31 = icmp eq i32 %191, %192
  br i1 %check_cmp31, label %193, label %checkBb32

checkBb32:                                        ; preds = %186
  call void @check_flag()
  br label %193

; <label>:193                                     ; preds = %checkBb32, %186
  %194 = sext i32 %191 to i64, !llfi_index !151
  %195 = load i32*** @wall, align 8, !llfi_index !152
  %196 = load i32*** @wall, align 8, !llfi_index !152
  %197 = getelementptr inbounds i32** %195, i64 %194, !llfi_index !153
  %198 = getelementptr inbounds i32** %196, i64 %194, !llfi_index !153
  %199 = load i32** %197, align 8, !llfi_index !154
  %200 = load i32** %198, align 8, !llfi_index !154
  %201 = getelementptr inbounds i32* %199, i64 %189, !llfi_index !155
  %202 = getelementptr inbounds i32* %200, i64 %190, !llfi_index !155
  %203 = load i32* %201, align 4, !llfi_index !156
  %204 = load i32* %202, align 4, !llfi_index !156
  %check_cmp33 = icmp eq i32 %203, %204
  br i1 %check_cmp33, label %205, label %checkBb34

checkBb34:                                        ; preds = %193
  call void @check_flag()
  br label %205

; <label>:205                                     ; preds = %checkBb34, %193
  %206 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i32 0, i32 0), i32 %203), !llfi_index !157
  br label %207, !llfi_index !158

; <label>:207                                     ; preds = %205
  %208 = load i32* %j3, align 4, !llfi_index !159
  %209 = load i32* %j3, align 4, !llfi_index !159
  %210 = add nsw i32 %208, 1, !llfi_index !160
  %211 = add nsw i32 %209, 1, !llfi_index !160
  %check_cmp35 = icmp eq i32 %210, %211
  br i1 %check_cmp35, label %212, label %checkBb36

checkBb36:                                        ; preds = %207
  call void @check_flag()
  br label %212

; <label>:212                                     ; preds = %checkBb36, %207
  store i32 %210, i32* %j3, align 4, !llfi_index !161
  br label %178, !llfi_index !162

; <label>:213                                     ; preds = %185
  %214 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !llfi_index !163
  br label %215, !llfi_index !164

; <label>:215                                     ; preds = %213
  %216 = load i32* %i2, align 4, !llfi_index !165
  %217 = load i32* %i2, align 4, !llfi_index !165
  %218 = add nsw i32 %216, 1, !llfi_index !166
  %219 = add nsw i32 %217, 1, !llfi_index !166
  %check_cmp37 = icmp eq i32 %218, %219
  br i1 %check_cmp37, label %220, label %checkBb38

checkBb38:                                        ; preds = %215
  call void @check_flag()
  br label %220

; <label>:220                                     ; preds = %checkBb38, %215
  store i32 %218, i32* %i2, align 4, !llfi_index !167
  br label %170, !llfi_index !168

; <label>:221                                     ; preds = %176
  ret void, !llfi_index !169
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #4

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #5

; Function Attrs: nobuiltin
declare noalias i8* @_Znam(i64) #6

; Function Attrs: nounwind
declare void @srand(i32) #7

; Function Attrs: nounwind
declare i32 @rand() #7

; Function Attrs: uwtable
define void @_Z5fatalPc(i8* %s) #3 {
  %1 = alloca i8*, align 8, !llfi_index !170
  store i8* %s, i8** %1, align 8, !llfi_index !171
  %2 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !172
  %3 = load i8** %1, align 8, !llfi_index !173
  %4 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), i8* %3), !llfi_index !174
  ret void, !llfi_index !175
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #3 {
  %1 = alloca i32, align 4, !llfi_index !176
  %2 = alloca i32, align 4, !llfi_index !177
  %3 = alloca i8**, align 8, !llfi_index !178
  store i32 0, i32* %1, !llfi_index !179
  store i32 %argc, i32* %2, align 4, !llfi_index !180
  store i8** %argv, i8*** %3, align 8, !llfi_index !181
  %4 = load i32* %2, align 4, !llfi_index !182
  %5 = load i32* %2, align 4, !llfi_index !182
  %check_cmp = icmp eq i32 %4, %5
  br i1 %check_cmp, label %6, label %checkBb

checkBb:                                          ; preds = %0
  call void @check_flag()
  br label %6

; <label>:6                                       ; preds = %checkBb, %0
  %7 = load i8*** %3, align 8, !llfi_index !183
  %8 = load i8*** %3, align 8, !llfi_index !183
  %check_cmp1 = icmp eq i8** %7, %8
  br i1 %check_cmp1, label %9, label %checkBb2

checkBb2:                                         ; preds = %6
  call void @check_flag()
  br label %9

; <label>:9                                       ; preds = %checkBb2, %6
  call void @_Z4initiPPc(i32 %4, i8** %7), !llfi_index !184
  %10 = load i32* %2, align 4, !llfi_index !185
  %11 = load i8*** %3, align 8, !llfi_index !186
  call void @_Z3runiPPc(i32 %10, i8** %11), !llfi_index !187
  ret i32 0, !llfi_index !188
}

; Function Attrs: uwtable
define void @_Z3runiPPc(i32 %argc, i8** %argv) #3 {
  %1 = alloca i32, align 4, !llfi_index !189
  %2 = alloca i8**, align 8, !llfi_index !190
  %cycles = alloca i64, align 8, !llfi_index !191
  %src = alloca i32*, align 8, !llfi_index !192
  %dst = alloca i32*, align 8, !llfi_index !193
  %temp = alloca i32*, align 8, !llfi_index !194
  %min = alloca i32, align 4, !llfi_index !195
  %t = alloca i32, align 4, !llfi_index !196
  %n = alloca i32, align 4, !llfi_index !197
  %i = alloca i32, align 4, !llfi_index !198
  %i1 = alloca i32, align 4, !llfi_index !199
  store i32 %argc, i32* %1, align 4, !llfi_index !200
  store i8** %argv, i8*** %2, align 8, !llfi_index !201
  %3 = load i32** @result, align 8, !llfi_index !202
  store i32* %3, i32** %dst, align 8, !llfi_index !203
  %4 = load i32* @cols, align 4, !llfi_index !204
  %5 = sext i32 %4 to i64, !llfi_index !205
  %6 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %5, i64 4), !llfi_index !206
  %7 = extractvalue { i64, i1 } %6, 1, !llfi_index !207
  %8 = extractvalue { i64, i1 } %6, 0, !llfi_index !208
  %9 = select i1 %7, i64 -1, i64 %8, !llfi_index !209
  %10 = call noalias i8* @_Znam(i64 %9) #11, !llfi_index !210
  %11 = bitcast i8* %10 to i32*, !llfi_index !211
  store i32* %11, i32** %src, align 8, !llfi_index !212
  store i32 0, i32* %t, align 4, !llfi_index !213
  br label %12, !llfi_index !214

; <label>:12                                      ; preds = %179, %0
  %13 = load i32* %t, align 4, !llfi_index !215
  %14 = load i32* %t, align 4, !llfi_index !215
  %15 = load i32* @rows, align 4, !llfi_index !216
  %16 = sub nsw i32 %15, 1, !llfi_index !217
  %17 = icmp slt i32 %13, %16, !llfi_index !218
  %18 = icmp slt i32 %14, %16, !llfi_index !218
  %check_cmp = icmp eq i1 %17, %18
  br i1 %check_cmp, label %19, label %checkBb

checkBb:                                          ; preds = %12
  call void @check_flag()
  br label %19

; <label>:19                                      ; preds = %checkBb, %12
  br i1 %17, label %20, label %180, !llfi_index !219

; <label>:20                                      ; preds = %19
  %21 = load i32** %src, align 8, !llfi_index !220
  store i32* %21, i32** %temp, align 8, !llfi_index !221
  %22 = load i32** %dst, align 8, !llfi_index !222
  store i32* %22, i32** %src, align 8, !llfi_index !223
  %23 = load i32** %temp, align 8, !llfi_index !224
  store i32* %23, i32** %dst, align 8, !llfi_index !225
  store i32 0, i32* %n, align 4, !llfi_index !226
  br label %24, !llfi_index !227

; <label>:24                                      ; preds = %172, %20
  %25 = load i32* %n, align 4, !llfi_index !228
  %26 = load i32* %n, align 4, !llfi_index !228
  %27 = load i32* @cols, align 4, !llfi_index !229
  %28 = icmp slt i32 %25, %27, !llfi_index !230
  %29 = icmp slt i32 %26, %27, !llfi_index !230
  %check_cmp1 = icmp eq i1 %28, %29
  br i1 %check_cmp1, label %30, label %checkBb2

checkBb2:                                         ; preds = %24
  call void @check_flag()
  br label %30

; <label>:30                                      ; preds = %checkBb2, %24
  br i1 %28, label %31, label %173, !llfi_index !231

; <label>:31                                      ; preds = %30
  %32 = load i32* %n, align 4, !llfi_index !232
  %33 = load i32* %n, align 4, !llfi_index !232
  %34 = sext i32 %32 to i64, !llfi_index !233
  %35 = sext i32 %33 to i64, !llfi_index !233
  %36 = load i32** %src, align 8, !llfi_index !234
  %37 = load i32** %src, align 8, !llfi_index !234
  %38 = getelementptr inbounds i32* %36, i64 %34, !llfi_index !235
  %39 = getelementptr inbounds i32* %37, i64 %35, !llfi_index !235
  %40 = load i32* %38, align 4, !llfi_index !236
  %41 = load i32* %39, align 4, !llfi_index !236
  %check_cmp3 = icmp eq i32 %40, %41
  br i1 %check_cmp3, label %42, label %checkBb4

checkBb4:                                         ; preds = %31
  call void @check_flag()
  br label %42

; <label>:42                                      ; preds = %checkBb4, %31
  store i32 %40, i32* %min, align 4, !llfi_index !237
  %43 = load i32* %n, align 4, !llfi_index !238
  %44 = load i32* %n, align 4, !llfi_index !238
  %45 = icmp sgt i32 %43, 0, !llfi_index !239
  %46 = icmp sgt i32 %44, 0, !llfi_index !239
  %check_cmp5 = icmp eq i1 %45, %46
  br i1 %check_cmp5, label %47, label %checkBb6

checkBb6:                                         ; preds = %42
  call void @check_flag()
  br label %47

; <label>:47                                      ; preds = %checkBb6, %42
  br i1 %45, label %48, label %85, !llfi_index !240

; <label>:48                                      ; preds = %47
  %49 = load i32* %min, align 4, !llfi_index !241
  %50 = load i32* %min, align 4, !llfi_index !241
  %51 = load i32* %n, align 4, !llfi_index !242
  %52 = sub nsw i32 %51, 1, !llfi_index !243
  %53 = sub nsw i32 %51, 1, !llfi_index !243
  %54 = sext i32 %52 to i64, !llfi_index !244
  %55 = sext i32 %53 to i64, !llfi_index !244
  %56 = load i32** %src, align 8, !llfi_index !245
  %57 = load i32** %src, align 8, !llfi_index !245
  %58 = getelementptr inbounds i32* %56, i64 %54, !llfi_index !246
  %59 = getelementptr inbounds i32* %57, i64 %55, !llfi_index !246
  %60 = load i32* %58, align 4, !llfi_index !247
  %61 = load i32* %59, align 4, !llfi_index !247
  %62 = icmp sle i32 %49, %60, !llfi_index !248
  %63 = icmp sle i32 %50, %61, !llfi_index !248
  %check_cmp7 = icmp eq i1 %62, %63
  br i1 %check_cmp7, label %64, label %checkBb8

checkBb8:                                         ; preds = %48
  call void @check_flag()
  br label %64

; <label>:64                                      ; preds = %checkBb8, %48
  br i1 %62, label %65, label %69, !llfi_index !249

; <label>:65                                      ; preds = %64
  %66 = load i32* %min, align 4, !llfi_index !250
  %67 = load i32* %min, align 4, !llfi_index !250
  %check_cmp9 = icmp eq i32 %66, %67
  br i1 %check_cmp9, label %68, label %checkBb10

checkBb10:                                        ; preds = %65
  call void @check_flag()
  br label %68

; <label>:68                                      ; preds = %checkBb10, %65
  br label %83, !llfi_index !251

; <label>:69                                      ; preds = %64
  %70 = load i32* %n, align 4, !llfi_index !252
  %71 = load i32* %n, align 4, !llfi_index !252
  %72 = sub nsw i32 %70, 1, !llfi_index !253
  %73 = sub nsw i32 %71, 1, !llfi_index !253
  %74 = sext i32 %72 to i64, !llfi_index !254
  %75 = sext i32 %73 to i64, !llfi_index !254
  %76 = load i32** %src, align 8, !llfi_index !255
  %77 = load i32** %src, align 8, !llfi_index !255
  %78 = getelementptr inbounds i32* %76, i64 %74, !llfi_index !256
  %79 = getelementptr inbounds i32* %77, i64 %75, !llfi_index !256
  %80 = load i32* %78, align 4, !llfi_index !257
  %81 = load i32* %79, align 4, !llfi_index !257
  %check_cmp11 = icmp eq i32 %80, %81
  br i1 %check_cmp11, label %82, label %checkBb12

checkBb12:                                        ; preds = %69
  call void @check_flag()
  br label %82

; <label>:82                                      ; preds = %checkBb12, %69
  br label %83, !llfi_index !258

; <label>:83                                      ; preds = %82, %68
  %84 = phi i32 [ %66, %68 ], [ %80, %82 ], !llfi_index !259
  store i32 %84, i32* %min, align 4, !llfi_index !260
  br label %85, !llfi_index !261

; <label>:85                                      ; preds = %83, %47
  %86 = load i32* %n, align 4, !llfi_index !262
  %87 = load i32* %n, align 4, !llfi_index !262
  %88 = load i32* @cols, align 4, !llfi_index !263
  %89 = load i32* @cols, align 4, !llfi_index !263
  %90 = sub nsw i32 %88, 1, !llfi_index !264
  %91 = sub nsw i32 %89, 1, !llfi_index !264
  %92 = icmp slt i32 %86, %90, !llfi_index !265
  %93 = icmp slt i32 %87, %91, !llfi_index !265
  %check_cmp13 = icmp eq i1 %92, %93
  br i1 %check_cmp13, label %94, label %checkBb14

checkBb14:                                        ; preds = %85
  call void @check_flag()
  br label %94

; <label>:94                                      ; preds = %checkBb14, %85
  br i1 %92, label %95, label %132, !llfi_index !266

; <label>:95                                      ; preds = %94
  %96 = load i32* %min, align 4, !llfi_index !267
  %97 = load i32* %min, align 4, !llfi_index !267
  %98 = load i32* %n, align 4, !llfi_index !268
  %99 = add nsw i32 %98, 1, !llfi_index !269
  %100 = add nsw i32 %98, 1, !llfi_index !269
  %101 = sext i32 %99 to i64, !llfi_index !270
  %102 = sext i32 %100 to i64, !llfi_index !270
  %check_cmp15 = icmp eq i64 %101, %102
  br i1 %check_cmp15, label %103, label %checkBb16

checkBb16:                                        ; preds = %95
  call void @check_flag()
  br label %103

; <label>:103                                     ; preds = %checkBb16, %95
  %104 = load i32** %src, align 8, !llfi_index !271
  %105 = load i32** %src, align 8, !llfi_index !271
  %check_cmp17 = icmp eq i32* %104, %105
  br i1 %check_cmp17, label %106, label %checkBb18

checkBb18:                                        ; preds = %103
  call void @check_flag()
  br label %106

; <label>:106                                     ; preds = %checkBb18, %103
  %107 = getelementptr inbounds i32* %104, i64 %101, !llfi_index !272
  %108 = load i32* %107, align 4, !llfi_index !273
  %109 = icmp sle i32 %96, %108, !llfi_index !274
  %110 = icmp sle i32 %97, %108, !llfi_index !274
  %check_cmp19 = icmp eq i1 %109, %110
  br i1 %check_cmp19, label %111, label %checkBb20

checkBb20:                                        ; preds = %106
  call void @check_flag()
  br label %111

; <label>:111                                     ; preds = %checkBb20, %106
  br i1 %109, label %112, label %116, !llfi_index !275

; <label>:112                                     ; preds = %111
  %113 = load i32* %min, align 4, !llfi_index !276
  %114 = load i32* %min, align 4, !llfi_index !276
  %check_cmp21 = icmp eq i32 %113, %114
  br i1 %check_cmp21, label %115, label %checkBb22

checkBb22:                                        ; preds = %112
  call void @check_flag()
  br label %115

; <label>:115                                     ; preds = %checkBb22, %112
  br label %130, !llfi_index !277

; <label>:116                                     ; preds = %111
  %117 = load i32* %n, align 4, !llfi_index !278
  %118 = load i32* %n, align 4, !llfi_index !278
  %119 = add nsw i32 %117, 1, !llfi_index !279
  %120 = add nsw i32 %118, 1, !llfi_index !279
  %121 = sext i32 %119 to i64, !llfi_index !280
  %122 = sext i32 %120 to i64, !llfi_index !280
  %123 = load i32** %src, align 8, !llfi_index !281
  %124 = load i32** %src, align 8, !llfi_index !281
  %125 = getelementptr inbounds i32* %123, i64 %121, !llfi_index !282
  %126 = getelementptr inbounds i32* %124, i64 %122, !llfi_index !282
  %127 = load i32* %125, align 4, !llfi_index !283
  %128 = load i32* %126, align 4, !llfi_index !283
  %check_cmp23 = icmp eq i32 %127, %128
  br i1 %check_cmp23, label %129, label %checkBb24

checkBb24:                                        ; preds = %116
  call void @check_flag()
  br label %129

; <label>:129                                     ; preds = %checkBb24, %116
  br label %130, !llfi_index !284

; <label>:130                                     ; preds = %129, %115
  %131 = phi i32 [ %113, %115 ], [ %127, %129 ], !llfi_index !285
  store i32 %131, i32* %min, align 4, !llfi_index !286
  br label %132, !llfi_index !287

; <label>:132                                     ; preds = %130, %94
  %133 = load i32* %n, align 4, !llfi_index !288
  %134 = load i32* %n, align 4, !llfi_index !288
  %135 = sext i32 %133 to i64, !llfi_index !289
  %136 = sext i32 %134 to i64, !llfi_index !289
  %137 = load i32* %t, align 4, !llfi_index !290
  %138 = load i32* %t, align 4, !llfi_index !290
  %139 = add nsw i32 %137, 1, !llfi_index !291
  %140 = add nsw i32 %138, 1, !llfi_index !291
  %check_cmp25 = icmp eq i32 %139, %140
  br i1 %check_cmp25, label %141, label %checkBb26

checkBb26:                                        ; preds = %132
  call void @check_flag()
  br label %141

; <label>:141                                     ; preds = %checkBb26, %132
  %142 = sext i32 %139 to i64, !llfi_index !292
  %143 = load i32*** @wall, align 8, !llfi_index !293
  %144 = load i32*** @wall, align 8, !llfi_index !293
  %check_cmp27 = icmp eq i32** %143, %144
  br i1 %check_cmp27, label %145, label %checkBb28

checkBb28:                                        ; preds = %141
  call void @check_flag()
  br label %145

; <label>:145                                     ; preds = %checkBb28, %141
  %146 = getelementptr inbounds i32** %143, i64 %142, !llfi_index !294
  %147 = load i32** %146, align 8, !llfi_index !295
  %148 = load i32** %146, align 8, !llfi_index !295
  %149 = getelementptr inbounds i32* %147, i64 %135, !llfi_index !296
  %150 = getelementptr inbounds i32* %148, i64 %136, !llfi_index !296
  %151 = load i32* %149, align 4, !llfi_index !297
  %152 = load i32* %150, align 4, !llfi_index !297
  %153 = load i32* %min, align 4, !llfi_index !298
  %154 = load i32* %min, align 4, !llfi_index !298
  %155 = add nsw i32 %151, %153, !llfi_index !299
  %156 = add nsw i32 %152, %154, !llfi_index !299
  %check_cmp29 = icmp eq i32 %155, %156
  br i1 %check_cmp29, label %157, label %checkBb30

checkBb30:                                        ; preds = %145
  call void @check_flag()
  br label %157

; <label>:157                                     ; preds = %checkBb30, %145
  %158 = load i32* %n, align 4, !llfi_index !300
  %159 = load i32* %n, align 4, !llfi_index !300
  %160 = sext i32 %158 to i64, !llfi_index !301
  %161 = sext i32 %159 to i64, !llfi_index !301
  %162 = load i32** %dst, align 8, !llfi_index !302
  %163 = load i32** %dst, align 8, !llfi_index !302
  %164 = getelementptr inbounds i32* %162, i64 %160, !llfi_index !303
  %165 = getelementptr inbounds i32* %163, i64 %161, !llfi_index !303
  %check_cmp31 = icmp eq i32* %164, %165
  br i1 %check_cmp31, label %166, label %checkBb32

checkBb32:                                        ; preds = %157
  call void @check_flag()
  br label %166

; <label>:166                                     ; preds = %checkBb32, %157
  store i32 %155, i32* %164, align 4, !llfi_index !304
  br label %167, !llfi_index !305

; <label>:167                                     ; preds = %166
  %168 = load i32* %n, align 4, !llfi_index !306
  %169 = load i32* %n, align 4, !llfi_index !306
  %170 = add nsw i32 %168, 1, !llfi_index !307
  %171 = add nsw i32 %169, 1, !llfi_index !307
  %check_cmp33 = icmp eq i32 %170, %171
  br i1 %check_cmp33, label %172, label %checkBb34

checkBb34:                                        ; preds = %167
  call void @check_flag()
  br label %172

; <label>:172                                     ; preds = %checkBb34, %167
  store i32 %170, i32* %n, align 4, !llfi_index !308
  br label %24, !llfi_index !309

; <label>:173                                     ; preds = %30
  br label %174, !llfi_index !310

; <label>:174                                     ; preds = %173
  %175 = load i32* %t, align 4, !llfi_index !311
  %176 = load i32* %t, align 4, !llfi_index !311
  %177 = add nsw i32 %175, 1, !llfi_index !312
  %178 = add nsw i32 %176, 1, !llfi_index !312
  %check_cmp35 = icmp eq i32 %177, %178
  br i1 %check_cmp35, label %179, label %checkBb36

checkBb36:                                        ; preds = %174
  call void @check_flag()
  br label %179

; <label>:179                                     ; preds = %checkBb36, %174
  store i32 %177, i32* %t, align 4, !llfi_index !313
  br label %12, !llfi_index !314

; <label>:180                                     ; preds = %19
  store i32 0, i32* %i, align 4, !llfi_index !315
  br label %181, !llfi_index !316

; <label>:181                                     ; preds = %207, %180
  %182 = load i32* %i, align 4, !llfi_index !317
  %183 = load i32* %i, align 4, !llfi_index !317
  %184 = load i32* @cols, align 4, !llfi_index !318
  %185 = load i32* @cols, align 4, !llfi_index !318
  %186 = icmp slt i32 %182, %184, !llfi_index !319
  %187 = icmp slt i32 %183, %185, !llfi_index !319
  %check_cmp37 = icmp eq i1 %186, %187
  br i1 %check_cmp37, label %188, label %checkBb38

checkBb38:                                        ; preds = %181
  call void @check_flag()
  br label %188

; <label>:188                                     ; preds = %checkBb38, %181
  br i1 %186, label %189, label %208, !llfi_index !320

; <label>:189                                     ; preds = %188
  %190 = load i32* %i, align 4, !llfi_index !321
  %191 = load i32* %i, align 4, !llfi_index !321
  %192 = sext i32 %190 to i64, !llfi_index !322
  %193 = sext i32 %191 to i64, !llfi_index !322
  %194 = load i32** @data, align 8, !llfi_index !323
  %195 = load i32** @data, align 8, !llfi_index !323
  %196 = getelementptr inbounds i32* %194, i64 %192, !llfi_index !324
  %197 = getelementptr inbounds i32* %195, i64 %193, !llfi_index !324
  %198 = load i32* %196, align 4, !llfi_index !325
  %199 = load i32* %197, align 4, !llfi_index !325
  %check_cmp39 = icmp eq i32 %198, %199
  br i1 %check_cmp39, label %200, label %checkBb40

checkBb40:                                        ; preds = %189
  call void @check_flag()
  br label %200

; <label>:200                                     ; preds = %checkBb40, %189
  %201 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i32 0, i32 0), i32 %198), !llfi_index !326
  br label %202, !llfi_index !327

; <label>:202                                     ; preds = %200
  %203 = load i32* %i, align 4, !llfi_index !328
  %204 = load i32* %i, align 4, !llfi_index !328
  %205 = add nsw i32 %203, 1, !llfi_index !329
  %206 = add nsw i32 %204, 1, !llfi_index !329
  %check_cmp41 = icmp eq i32 %205, %206
  br i1 %check_cmp41, label %207, label %checkBb42

checkBb42:                                        ; preds = %202
  call void @check_flag()
  br label %207

; <label>:207                                     ; preds = %checkBb42, %202
  store i32 %205, i32* %i, align 4, !llfi_index !330
  br label %181, !llfi_index !331

; <label>:208                                     ; preds = %188
  %209 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !llfi_index !332
  store i32 0, i32* %i1, align 4, !llfi_index !333
  br label %210, !llfi_index !334

; <label>:210                                     ; preds = %236, %208
  %211 = load i32* %i1, align 4, !llfi_index !335
  %212 = load i32* %i1, align 4, !llfi_index !335
  %213 = load i32* @cols, align 4, !llfi_index !336
  %214 = load i32* @cols, align 4, !llfi_index !336
  %215 = icmp slt i32 %211, %213, !llfi_index !337
  %216 = icmp slt i32 %212, %214, !llfi_index !337
  %check_cmp43 = icmp eq i1 %215, %216
  br i1 %check_cmp43, label %217, label %checkBb44

checkBb44:                                        ; preds = %210
  call void @check_flag()
  br label %217

; <label>:217                                     ; preds = %checkBb44, %210
  br i1 %215, label %218, label %237, !llfi_index !338

; <label>:218                                     ; preds = %217
  %219 = load i32* %i1, align 4, !llfi_index !339
  %220 = load i32* %i1, align 4, !llfi_index !339
  %221 = sext i32 %219 to i64, !llfi_index !340
  %222 = sext i32 %220 to i64, !llfi_index !340
  %223 = load i32** %dst, align 8, !llfi_index !341
  %224 = load i32** %dst, align 8, !llfi_index !341
  %225 = getelementptr inbounds i32* %223, i64 %221, !llfi_index !342
  %226 = getelementptr inbounds i32* %224, i64 %222, !llfi_index !342
  %227 = load i32* %225, align 4, !llfi_index !343
  %228 = load i32* %226, align 4, !llfi_index !343
  %check_cmp45 = icmp eq i32 %227, %228
  br i1 %check_cmp45, label %229, label %checkBb46

checkBb46:                                        ; preds = %218
  call void @check_flag()
  br label %229

; <label>:229                                     ; preds = %checkBb46, %218
  %230 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i32 0, i32 0), i32 %227), !llfi_index !344
  br label %231, !llfi_index !345

; <label>:231                                     ; preds = %229
  %232 = load i32* %i1, align 4, !llfi_index !346
  %233 = load i32* %i1, align 4, !llfi_index !346
  %234 = add nsw i32 %232, 1, !llfi_index !347
  %235 = add nsw i32 %233, 1, !llfi_index !347
  %check_cmp47 = icmp eq i32 %234, %235
  br i1 %check_cmp47, label %236, label %checkBb48

checkBb48:                                        ; preds = %231
  call void @check_flag()
  br label %236

; <label>:236                                     ; preds = %checkBb48, %231
  store i32 %234, i32* %i1, align 4, !llfi_index !348
  br label %210, !llfi_index !349

; <label>:237                                     ; preds = %217
  %238 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !llfi_index !350
  %239 = load i32** @data, align 8, !llfi_index !351
  %240 = icmp eq i32* %239, null, !llfi_index !352
  br i1 %240, label %243, label %241, !llfi_index !353

; <label>:241                                     ; preds = %237
  %242 = bitcast i32* %239 to i8*, !llfi_index !354
  call void @_ZdaPv(i8* %242) #13, !llfi_index !355
  br label %243, !llfi_index !356

; <label>:243                                     ; preds = %241, %237
  %244 = load i32*** @wall, align 8, !llfi_index !357
  %245 = icmp eq i32** %244, null, !llfi_index !358
  br i1 %245, label %248, label %246, !llfi_index !359

; <label>:246                                     ; preds = %243
  %247 = bitcast i32** %244 to i8*, !llfi_index !360
  call void @_ZdaPv(i8* %247) #13, !llfi_index !361
  br label %248, !llfi_index !362

; <label>:248                                     ; preds = %246, %243
  %249 = load i32** %dst, align 8, !llfi_index !363
  %250 = icmp eq i32* %249, null, !llfi_index !364
  br i1 %250, label %253, label %251, !llfi_index !365

; <label>:251                                     ; preds = %248
  %252 = bitcast i32* %249 to i8*, !llfi_index !366
  call void @_ZdaPv(i8* %252) #13, !llfi_index !367
  br label %253, !llfi_index !368

; <label>:253                                     ; preds = %251, %248
  %254 = load i32** %src, align 8, !llfi_index !369
  %255 = icmp eq i32* %254, null, !llfi_index !370
  br i1 %255, label %258, label %256, !llfi_index !371

; <label>:256                                     ; preds = %253
  %257 = bitcast i32* %254 to i8*, !llfi_index !372
  call void @_ZdaPv(i8* %257) #13, !llfi_index !373
  br label %258, !llfi_index !374

; <label>:258                                     ; preds = %256, %253
  ret void, !llfi_index !375
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(i8*) #8

declare void @dumpIndex(i64)

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }
attributes #6 = { nobuiltin "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nobuiltin nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly }
attributes #11 = { builtin }
attributes #12 = { nounwind }
attributes #13 = { builtin nounwind }

!llvm.ident = !{!0, !0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
!1 = metadata !{i64 1}
!2 = metadata !{i64 2}
!3 = metadata !{i64 3}
!4 = metadata !{i64 4}
!5 = metadata !{i64 5}
!6 = metadata !{i64 6}
!7 = metadata !{i64 7}
!8 = metadata !{i64 8}
!9 = metadata !{i64 9}
!10 = metadata !{i64 10}
!11 = metadata !{i64 11}
!12 = metadata !{i64 12}
!13 = metadata !{i64 13}
!14 = metadata !{i64 14}
!15 = metadata !{i64 15}
!16 = metadata !{i64 16}
!17 = metadata !{i64 17}
!18 = metadata !{i64 18}
!19 = metadata !{i64 19}
!20 = metadata !{i64 20}
!21 = metadata !{i64 21}
!22 = metadata !{i64 22}
!23 = metadata !{i64 23}
!24 = metadata !{i64 24}
!25 = metadata !{i64 25}
!26 = metadata !{i64 26}
!27 = metadata !{i64 27}
!28 = metadata !{i64 28}
!29 = metadata !{i64 29}
!30 = metadata !{i64 30}
!31 = metadata !{i64 31}
!32 = metadata !{i64 32}
!33 = metadata !{i64 33}
!34 = metadata !{i64 34}
!35 = metadata !{i64 35}
!36 = metadata !{i64 36}
!37 = metadata !{i64 37}
!38 = metadata !{i64 38}
!39 = metadata !{i64 39}
!40 = metadata !{i64 40}
!41 = metadata !{i64 41}
!42 = metadata !{i64 42}
!43 = metadata !{i64 43}
!44 = metadata !{i64 44}
!45 = metadata !{i64 45}
!46 = metadata !{i64 46}
!47 = metadata !{i64 47}
!48 = metadata !{i64 48}
!49 = metadata !{i64 49}
!50 = metadata !{i64 50}
!51 = metadata !{i64 51}
!52 = metadata !{i64 52}
!53 = metadata !{i64 53}
!54 = metadata !{i64 54}
!55 = metadata !{i64 55}
!56 = metadata !{i64 56}
!57 = metadata !{i64 57}
!58 = metadata !{i64 58}
!59 = metadata !{i64 59}
!60 = metadata !{i64 60}
!61 = metadata !{i64 61}
!62 = metadata !{i64 62}
!63 = metadata !{i64 63}
!64 = metadata !{i64 64}
!65 = metadata !{i64 65}
!66 = metadata !{i64 66}
!67 = metadata !{i64 67}
!68 = metadata !{i64 68}
!69 = metadata !{i64 69}
!70 = metadata !{i64 70}
!71 = metadata !{i64 71}
!72 = metadata !{i64 72}
!73 = metadata !{i64 73}
!74 = metadata !{i64 74}
!75 = metadata !{i64 75}
!76 = metadata !{i64 76}
!77 = metadata !{i64 77}
!78 = metadata !{i64 78}
!79 = metadata !{i64 79}
!80 = metadata !{i64 80}
!81 = metadata !{i64 81}
!82 = metadata !{i64 82}
!83 = metadata !{i64 83}
!84 = metadata !{i64 84}
!85 = metadata !{i64 85}
!86 = metadata !{i64 86}
!87 = metadata !{i64 87}
!88 = metadata !{i64 88}
!89 = metadata !{i64 89}
!90 = metadata !{i64 90}
!91 = metadata !{i64 91}
!92 = metadata !{i64 92}
!93 = metadata !{i64 93}
!94 = metadata !{i64 94}
!95 = metadata !{i64 95}
!96 = metadata !{i64 96}
!97 = metadata !{i64 97}
!98 = metadata !{i64 98}
!99 = metadata !{i64 99}
!100 = metadata !{i64 100}
!101 = metadata !{i64 101}
!102 = metadata !{i64 102}
!103 = metadata !{i64 103}
!104 = metadata !{i64 104}
!105 = metadata !{i64 105}
!106 = metadata !{i64 106}
!107 = metadata !{i64 107}
!108 = metadata !{i64 108}
!109 = metadata !{i64 109}
!110 = metadata !{i64 110}
!111 = metadata !{i64 111}
!112 = metadata !{i64 112}
!113 = metadata !{i64 113}
!114 = metadata !{i64 114}
!115 = metadata !{i64 115}
!116 = metadata !{i64 116}
!117 = metadata !{i64 117}
!118 = metadata !{i64 118}
!119 = metadata !{i64 119}
!120 = metadata !{i64 120}
!121 = metadata !{i64 121}
!122 = metadata !{i64 122}
!123 = metadata !{i64 123}
!124 = metadata !{i64 124}
!125 = metadata !{i64 125}
!126 = metadata !{i64 126}
!127 = metadata !{i64 127}
!128 = metadata !{i64 128}
!129 = metadata !{i64 129}
!130 = metadata !{i64 130}
!131 = metadata !{i64 131}
!132 = metadata !{i64 132}
!133 = metadata !{i64 133}
!134 = metadata !{i64 134}
!135 = metadata !{i64 135}
!136 = metadata !{i64 136}
!137 = metadata !{i64 137}
!138 = metadata !{i64 138}
!139 = metadata !{i64 139}
!140 = metadata !{i64 140}
!141 = metadata !{i64 141}
!142 = metadata !{i64 142}
!143 = metadata !{i64 143}
!144 = metadata !{i64 144}
!145 = metadata !{i64 145}
!146 = metadata !{i64 146}
!147 = metadata !{i64 147}
!148 = metadata !{i64 148}
!149 = metadata !{i64 149}
!150 = metadata !{i64 150}
!151 = metadata !{i64 151}
!152 = metadata !{i64 152}
!153 = metadata !{i64 153}
!154 = metadata !{i64 154}
!155 = metadata !{i64 155}
!156 = metadata !{i64 156}
!157 = metadata !{i64 157}
!158 = metadata !{i64 158}
!159 = metadata !{i64 159}
!160 = metadata !{i64 160}
!161 = metadata !{i64 161}
!162 = metadata !{i64 162}
!163 = metadata !{i64 163}
!164 = metadata !{i64 164}
!165 = metadata !{i64 165}
!166 = metadata !{i64 166}
!167 = metadata !{i64 167}
!168 = metadata !{i64 168}
!169 = metadata !{i64 169}
!170 = metadata !{i64 170}
!171 = metadata !{i64 171}
!172 = metadata !{i64 172}
!173 = metadata !{i64 173}
!174 = metadata !{i64 174}
!175 = metadata !{i64 175}
!176 = metadata !{i64 176}
!177 = metadata !{i64 177}
!178 = metadata !{i64 178}
!179 = metadata !{i64 179}
!180 = metadata !{i64 180}
!181 = metadata !{i64 181}
!182 = metadata !{i64 182}
!183 = metadata !{i64 183}
!184 = metadata !{i64 184}
!185 = metadata !{i64 185}
!186 = metadata !{i64 186}
!187 = metadata !{i64 187}
!188 = metadata !{i64 188}
!189 = metadata !{i64 189}
!190 = metadata !{i64 190}
!191 = metadata !{i64 191}
!192 = metadata !{i64 192}
!193 = metadata !{i64 193}
!194 = metadata !{i64 194}
!195 = metadata !{i64 195}
!196 = metadata !{i64 196}
!197 = metadata !{i64 197}
!198 = metadata !{i64 198}
!199 = metadata !{i64 199}
!200 = metadata !{i64 200}
!201 = metadata !{i64 201}
!202 = metadata !{i64 202}
!203 = metadata !{i64 203}
!204 = metadata !{i64 204}
!205 = metadata !{i64 205}
!206 = metadata !{i64 206}
!207 = metadata !{i64 207}
!208 = metadata !{i64 208}
!209 = metadata !{i64 209}
!210 = metadata !{i64 210}
!211 = metadata !{i64 211}
!212 = metadata !{i64 212}
!213 = metadata !{i64 213}
!214 = metadata !{i64 214}
!215 = metadata !{i64 215}
!216 = metadata !{i64 216}
!217 = metadata !{i64 217}
!218 = metadata !{i64 218}
!219 = metadata !{i64 219}
!220 = metadata !{i64 220}
!221 = metadata !{i64 221}
!222 = metadata !{i64 222}
!223 = metadata !{i64 223}
!224 = metadata !{i64 224}
!225 = metadata !{i64 225}
!226 = metadata !{i64 226}
!227 = metadata !{i64 227}
!228 = metadata !{i64 228}
!229 = metadata !{i64 229}
!230 = metadata !{i64 230}
!231 = metadata !{i64 231}
!232 = metadata !{i64 232}
!233 = metadata !{i64 233}
!234 = metadata !{i64 234}
!235 = metadata !{i64 235}
!236 = metadata !{i64 236}
!237 = metadata !{i64 237}
!238 = metadata !{i64 238}
!239 = metadata !{i64 239}
!240 = metadata !{i64 240}
!241 = metadata !{i64 241}
!242 = metadata !{i64 242}
!243 = metadata !{i64 243}
!244 = metadata !{i64 244}
!245 = metadata !{i64 245}
!246 = metadata !{i64 246}
!247 = metadata !{i64 247}
!248 = metadata !{i64 248}
!249 = metadata !{i64 249}
!250 = metadata !{i64 250}
!251 = metadata !{i64 251}
!252 = metadata !{i64 252}
!253 = metadata !{i64 253}
!254 = metadata !{i64 254}
!255 = metadata !{i64 255}
!256 = metadata !{i64 256}
!257 = metadata !{i64 257}
!258 = metadata !{i64 258}
!259 = metadata !{i64 259}
!260 = metadata !{i64 260}
!261 = metadata !{i64 261}
!262 = metadata !{i64 262}
!263 = metadata !{i64 263}
!264 = metadata !{i64 264}
!265 = metadata !{i64 265}
!266 = metadata !{i64 266}
!267 = metadata !{i64 267}
!268 = metadata !{i64 268}
!269 = metadata !{i64 269}
!270 = metadata !{i64 270}
!271 = metadata !{i64 271}
!272 = metadata !{i64 272}
!273 = metadata !{i64 273}
!274 = metadata !{i64 274}
!275 = metadata !{i64 275}
!276 = metadata !{i64 276}
!277 = metadata !{i64 277}
!278 = metadata !{i64 278}
!279 = metadata !{i64 279}
!280 = metadata !{i64 280}
!281 = metadata !{i64 281}
!282 = metadata !{i64 282}
!283 = metadata !{i64 283}
!284 = metadata !{i64 284}
!285 = metadata !{i64 285}
!286 = metadata !{i64 286}
!287 = metadata !{i64 287}
!288 = metadata !{i64 288}
!289 = metadata !{i64 289}
!290 = metadata !{i64 290}
!291 = metadata !{i64 291}
!292 = metadata !{i64 292}
!293 = metadata !{i64 293}
!294 = metadata !{i64 294}
!295 = metadata !{i64 295}
!296 = metadata !{i64 296}
!297 = metadata !{i64 297}
!298 = metadata !{i64 298}
!299 = metadata !{i64 299}
!300 = metadata !{i64 300}
!301 = metadata !{i64 301}
!302 = metadata !{i64 302}
!303 = metadata !{i64 303}
!304 = metadata !{i64 304}
!305 = metadata !{i64 305}
!306 = metadata !{i64 306}
!307 = metadata !{i64 307}
!308 = metadata !{i64 308}
!309 = metadata !{i64 309}
!310 = metadata !{i64 310}
!311 = metadata !{i64 311}
!312 = metadata !{i64 312}
!313 = metadata !{i64 313}
!314 = metadata !{i64 314}
!315 = metadata !{i64 315}
!316 = metadata !{i64 316}
!317 = metadata !{i64 317}
!318 = metadata !{i64 318}
!319 = metadata !{i64 319}
!320 = metadata !{i64 320}
!321 = metadata !{i64 321}
!322 = metadata !{i64 322}
!323 = metadata !{i64 323}
!324 = metadata !{i64 324}
!325 = metadata !{i64 325}
!326 = metadata !{i64 326}
!327 = metadata !{i64 327}
!328 = metadata !{i64 328}
!329 = metadata !{i64 329}
!330 = metadata !{i64 330}
!331 = metadata !{i64 331}
!332 = metadata !{i64 332}
!333 = metadata !{i64 333}
!334 = metadata !{i64 334}
!335 = metadata !{i64 335}
!336 = metadata !{i64 336}
!337 = metadata !{i64 337}
!338 = metadata !{i64 338}
!339 = metadata !{i64 339}
!340 = metadata !{i64 340}
!341 = metadata !{i64 341}
!342 = metadata !{i64 342}
!343 = metadata !{i64 343}
!344 = metadata !{i64 344}
!345 = metadata !{i64 345}
!346 = metadata !{i64 346}
!347 = metadata !{i64 347}
!348 = metadata !{i64 348}
!349 = metadata !{i64 349}
!350 = metadata !{i64 350}
!351 = metadata !{i64 351}
!352 = metadata !{i64 352}
!353 = metadata !{i64 353}
!354 = metadata !{i64 354}
!355 = metadata !{i64 355}
!356 = metadata !{i64 356}
!357 = metadata !{i64 357}
!358 = metadata !{i64 358}
!359 = metadata !{i64 359}
!360 = metadata !{i64 360}
!361 = metadata !{i64 361}
!362 = metadata !{i64 362}
!363 = metadata !{i64 363}
!364 = metadata !{i64 364}
!365 = metadata !{i64 365}
!366 = metadata !{i64 366}
!367 = metadata !{i64 367}
!368 = metadata !{i64 368}
!369 = metadata !{i64 369}
!370 = metadata !{i64 370}
!371 = metadata !{i64 371}
!372 = metadata !{i64 372}
!373 = metadata !{i64 373}
!374 = metadata !{i64 374}
!375 = metadata !{i64 375}
