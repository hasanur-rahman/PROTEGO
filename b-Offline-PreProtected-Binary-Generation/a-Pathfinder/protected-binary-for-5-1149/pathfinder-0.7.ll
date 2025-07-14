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
  br i1 %5, label %8, label %24, !llfi_index !13

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
  %18 = getelementptr inbounds i8** %17, i64 2, !llfi_index !20
  %19 = getelementptr inbounds i8** %17, i64 2, !llfi_index !20
  %20 = load i8** %18, align 8, !llfi_index !21
  %21 = load i8** %19, align 8, !llfi_index !21
  %check_cmp3 = icmp eq i8* %20, %21
  br i1 %check_cmp3, label %22, label %checkBb4

checkBb4:                                         ; preds = %15
  call void @check_flag()
  br label %22

; <label>:22                                      ; preds = %checkBb4, %15
  %23 = call i32 @atoi(i8* %20) #10, !llfi_index !22
  store i32 %23, i32* @rows, align 4, !llfi_index !23
  br label %26, !llfi_index !24

; <label>:24                                      ; preds = %7
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str1, i32 0, i32 0)), !llfi_index !25
  call void @exit(i32 0) #9, !llfi_index !26
  unreachable, !llfi_index !27

; <label>:26                                      ; preds = %22
  %27 = load i32* @rows, align 4, !llfi_index !28
  %28 = load i32* @cols, align 4, !llfi_index !29
  %29 = mul nsw i32 %27, %28, !llfi_index !30
  %30 = sext i32 %29 to i64, !llfi_index !31
  %31 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %30, i64 4), !llfi_index !32
  %32 = extractvalue { i64, i1 } %31, 1, !llfi_index !33
  %33 = extractvalue { i64, i1 } %31, 0, !llfi_index !34
  %34 = select i1 %32, i64 -1, i64 %33, !llfi_index !35
  %35 = call noalias i8* @_Znam(i64 %34) #11, !llfi_index !36
  %36 = bitcast i8* %35 to i32*, !llfi_index !37
  store i32* %36, i32** @data, align 8, !llfi_index !38
  %37 = load i32* @rows, align 4, !llfi_index !39
  %38 = sext i32 %37 to i64, !llfi_index !40
  %39 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %38, i64 8), !llfi_index !41
  %40 = extractvalue { i64, i1 } %39, 1, !llfi_index !42
  %41 = extractvalue { i64, i1 } %39, 0, !llfi_index !43
  %42 = select i1 %40, i64 -1, i64 %41, !llfi_index !44
  %43 = call noalias i8* @_Znam(i64 %42) #11, !llfi_index !45
  %44 = bitcast i8* %43 to i32**, !llfi_index !46
  store i32** %44, i32*** @wall, align 8, !llfi_index !47
  store i32 0, i32* %n, align 4, !llfi_index !48
  br label %45, !llfi_index !49

; <label>:45                                      ; preds = %67, %26
  %46 = load i32* %n, align 4, !llfi_index !50
  %47 = load i32* @rows, align 4, !llfi_index !51
  %48 = icmp slt i32 %46, %47, !llfi_index !52
  br i1 %48, label %49, label %70, !llfi_index !53

; <label>:49                                      ; preds = %45
  %50 = load i32** @data, align 8, !llfi_index !54
  %51 = load i32** @data, align 8, !llfi_index !54
  %check_cmp5 = icmp eq i32* %50, %51
  br i1 %check_cmp5, label %52, label %checkBb6

checkBb6:                                         ; preds = %49
  call void @check_flag()
  br label %52

; <label>:52                                      ; preds = %checkBb6, %49
  %53 = load i32* @cols, align 4, !llfi_index !55
  %54 = load i32* @cols, align 4, !llfi_index !55
  %55 = load i32* %n, align 4, !llfi_index !56
  %56 = load i32* %n, align 4, !llfi_index !56
  %57 = mul nsw i32 %53, %55, !llfi_index !57
  %58 = mul nsw i32 %54, %56, !llfi_index !57
  %59 = sext i32 %57 to i64, !llfi_index !58
  %60 = sext i32 %58 to i64, !llfi_index !58
  %check_cmp7 = icmp eq i64 %59, %60
  br i1 %check_cmp7, label %61, label %checkBb8

checkBb8:                                         ; preds = %52
  call void @check_flag()
  br label %61

; <label>:61                                      ; preds = %checkBb8, %52
  %62 = getelementptr inbounds i32* %50, i64 %59, !llfi_index !59
  %63 = load i32* %n, align 4, !llfi_index !60
  %64 = sext i32 %63 to i64, !llfi_index !61
  %65 = load i32*** @wall, align 8, !llfi_index !62
  %66 = getelementptr inbounds i32** %65, i64 %64, !llfi_index !63
  store i32* %62, i32** %66, align 8, !llfi_index !64
  br label %67, !llfi_index !65

; <label>:67                                      ; preds = %61
  %68 = load i32* %n, align 4, !llfi_index !66
  %69 = add nsw i32 %68, 1, !llfi_index !67
  store i32 %69, i32* %n, align 4, !llfi_index !68
  br label %45, !llfi_index !69

; <label>:70                                      ; preds = %45
  %71 = load i32* @cols, align 4, !llfi_index !70
  %72 = sext i32 %71 to i64, !llfi_index !71
  %73 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %72, i64 4), !llfi_index !72
  %74 = extractvalue { i64, i1 } %73, 1, !llfi_index !73
  %75 = extractvalue { i64, i1 } %73, 0, !llfi_index !74
  %76 = select i1 %74, i64 -1, i64 %75, !llfi_index !75
  %77 = call noalias i8* @_Znam(i64 %76) #11, !llfi_index !76
  %78 = bitcast i8* %77 to i32*, !llfi_index !77
  store i32* %78, i32** @result, align 8, !llfi_index !78
  call void @srand(i32 10) #12, !llfi_index !79
  store i32 0, i32* %i, align 4, !llfi_index !80
  br label %79, !llfi_index !81

; <label>:79                                      ; preds = %130, %70
  %80 = load i32* %i, align 4, !llfi_index !82
  %81 = load i32* %i, align 4, !llfi_index !82
  %82 = load i32* @rows, align 4, !llfi_index !83
  %83 = load i32* @rows, align 4, !llfi_index !83
  %84 = icmp slt i32 %80, %82, !llfi_index !84
  %85 = icmp slt i32 %81, %83, !llfi_index !84
  %check_cmp9 = icmp eq i1 %84, %85
  br i1 %check_cmp9, label %86, label %checkBb10

checkBb10:                                        ; preds = %79
  call void @check_flag()
  br label %86

; <label>:86                                      ; preds = %checkBb10, %79
  br i1 %84, label %87, label %131, !llfi_index !85

; <label>:87                                      ; preds = %86
  store i32 0, i32* %j, align 4, !llfi_index !86
  br label %88, !llfi_index !87

; <label>:88                                      ; preds = %123, %87
  %89 = load i32* %j, align 4, !llfi_index !88
  %90 = load i32* %j, align 4, !llfi_index !88
  %91 = load i32* @cols, align 4, !llfi_index !89
  %92 = load i32* @cols, align 4, !llfi_index !89
  %93 = icmp slt i32 %89, %91, !llfi_index !90
  %94 = icmp slt i32 %90, %92, !llfi_index !90
  %check_cmp11 = icmp eq i1 %93, %94
  br i1 %check_cmp11, label %95, label %checkBb12

checkBb12:                                        ; preds = %88
  call void @check_flag()
  br label %95

; <label>:95                                      ; preds = %checkBb12, %88
  br i1 %93, label %96, label %124, !llfi_index !91

; <label>:96                                      ; preds = %95
  %97 = call i32 @rand() #12, !llfi_index !92
  %98 = srem i32 %97, 10, !llfi_index !93
  %99 = srem i32 %97, 10, !llfi_index !93
  %check_cmp13 = icmp eq i32 %98, %99
  br i1 %check_cmp13, label %100, label %checkBb14

checkBb14:                                        ; preds = %96
  call void @check_flag()
  br label %100

; <label>:100                                     ; preds = %checkBb14, %96
  %101 = load i32* %j, align 4, !llfi_index !94
  %102 = load i32* %j, align 4, !llfi_index !94
  %103 = sext i32 %101 to i64, !llfi_index !95
  %104 = sext i32 %102 to i64, !llfi_index !95
  %105 = load i32* %i, align 4, !llfi_index !96
  %106 = load i32* %i, align 4, !llfi_index !96
  %107 = sext i32 %105 to i64, !llfi_index !97
  %108 = sext i32 %106 to i64, !llfi_index !97
  %109 = load i32*** @wall, align 8, !llfi_index !98
  %110 = load i32*** @wall, align 8, !llfi_index !98
  %111 = getelementptr inbounds i32** %109, i64 %107, !llfi_index !99
  %112 = getelementptr inbounds i32** %110, i64 %108, !llfi_index !99
  %113 = load i32** %111, align 8, !llfi_index !100
  %114 = load i32** %112, align 8, !llfi_index !100
  %115 = getelementptr inbounds i32* %113, i64 %103, !llfi_index !101
  %116 = getelementptr inbounds i32* %114, i64 %104, !llfi_index !101
  %check_cmp15 = icmp eq i32* %115, %116
  br i1 %check_cmp15, label %117, label %checkBb16

checkBb16:                                        ; preds = %100
  call void @check_flag()
  br label %117

; <label>:117                                     ; preds = %checkBb16, %100
  store i32 %98, i32* %115, align 4, !llfi_index !102
  br label %118, !llfi_index !103

; <label>:118                                     ; preds = %117
  %119 = load i32* %j, align 4, !llfi_index !104
  %120 = load i32* %j, align 4, !llfi_index !104
  %121 = add nsw i32 %119, 1, !llfi_index !105
  %122 = add nsw i32 %120, 1, !llfi_index !105
  %check_cmp17 = icmp eq i32 %121, %122
  br i1 %check_cmp17, label %123, label %checkBb18

checkBb18:                                        ; preds = %118
  call void @check_flag()
  br label %123

; <label>:123                                     ; preds = %checkBb18, %118
  store i32 %121, i32* %j, align 4, !llfi_index !106
  br label %88, !llfi_index !107

; <label>:124                                     ; preds = %95
  br label %125, !llfi_index !108

; <label>:125                                     ; preds = %124
  %126 = load i32* %i, align 4, !llfi_index !109
  %127 = load i32* %i, align 4, !llfi_index !109
  %128 = add nsw i32 %126, 1, !llfi_index !110
  %129 = add nsw i32 %127, 1, !llfi_index !110
  %check_cmp19 = icmp eq i32 %128, %129
  br i1 %check_cmp19, label %130, label %checkBb20

checkBb20:                                        ; preds = %125
  call void @check_flag()
  br label %130

; <label>:130                                     ; preds = %checkBb20, %125
  store i32 %128, i32* %i, align 4, !llfi_index !111
  br label %79, !llfi_index !112

; <label>:131                                     ; preds = %86
  store i32 0, i32* %j1, align 4, !llfi_index !113
  br label %132, !llfi_index !114

; <label>:132                                     ; preds = %170, %131
  %133 = load i32* %j1, align 4, !llfi_index !115
  %134 = load i32* %j1, align 4, !llfi_index !115
  %135 = load i32* @cols, align 4, !llfi_index !116
  %136 = load i32* @cols, align 4, !llfi_index !116
  %137 = icmp slt i32 %133, %135, !llfi_index !117
  %138 = icmp slt i32 %134, %136, !llfi_index !117
  %check_cmp21 = icmp eq i1 %137, %138
  br i1 %check_cmp21, label %139, label %checkBb22

checkBb22:                                        ; preds = %132
  call void @check_flag()
  br label %139

; <label>:139                                     ; preds = %checkBb22, %132
  br i1 %137, label %140, label %171, !llfi_index !118

; <label>:140                                     ; preds = %139
  %141 = load i32* %j1, align 4, !llfi_index !119
  %142 = load i32* %j1, align 4, !llfi_index !119
  %143 = sext i32 %141 to i64, !llfi_index !120
  %144 = sext i32 %142 to i64, !llfi_index !120
  %145 = load i32*** @wall, align 8, !llfi_index !121
  %146 = load i32*** @wall, align 8, !llfi_index !121
  %147 = getelementptr inbounds i32** %145, i64 0, !llfi_index !122
  %148 = getelementptr inbounds i32** %146, i64 0, !llfi_index !122
  %149 = load i32** %147, align 8, !llfi_index !123
  %150 = load i32** %148, align 8, !llfi_index !123
  %151 = getelementptr inbounds i32* %149, i64 %143, !llfi_index !124
  %152 = getelementptr inbounds i32* %150, i64 %144, !llfi_index !124
  %153 = load i32* %151, align 4, !llfi_index !125
  %154 = load i32* %152, align 4, !llfi_index !125
  %check_cmp23 = icmp eq i32 %153, %154
  br i1 %check_cmp23, label %155, label %checkBb24

checkBb24:                                        ; preds = %140
  call void @check_flag()
  br label %155

; <label>:155                                     ; preds = %checkBb24, %140
  %156 = load i32* %j1, align 4, !llfi_index !126
  %157 = load i32* %j1, align 4, !llfi_index !126
  %158 = sext i32 %156 to i64, !llfi_index !127
  %159 = sext i32 %157 to i64, !llfi_index !127
  %160 = load i32** @result, align 8, !llfi_index !128
  %161 = load i32** @result, align 8, !llfi_index !128
  %162 = getelementptr inbounds i32* %160, i64 %158, !llfi_index !129
  %163 = getelementptr inbounds i32* %161, i64 %159, !llfi_index !129
  %check_cmp25 = icmp eq i32* %162, %163
  br i1 %check_cmp25, label %164, label %checkBb26

checkBb26:                                        ; preds = %155
  call void @check_flag()
  br label %164

; <label>:164                                     ; preds = %checkBb26, %155
  store i32 %153, i32* %162, align 4, !llfi_index !130
  br label %165, !llfi_index !131

; <label>:165                                     ; preds = %164
  %166 = load i32* %j1, align 4, !llfi_index !132
  %167 = load i32* %j1, align 4, !llfi_index !132
  %168 = add nsw i32 %166, 1, !llfi_index !133
  %169 = add nsw i32 %167, 1, !llfi_index !133
  %check_cmp27 = icmp eq i32 %168, %169
  br i1 %check_cmp27, label %170, label %checkBb28

checkBb28:                                        ; preds = %165
  call void @check_flag()
  br label %170

; <label>:170                                     ; preds = %checkBb28, %165
  store i32 %168, i32* %j1, align 4, !llfi_index !134
  br label %132, !llfi_index !135

; <label>:171                                     ; preds = %139
  store i32 0, i32* %i2, align 4, !llfi_index !136
  br label %172, !llfi_index !137

; <label>:172                                     ; preds = %221, %171
  %173 = load i32* %i2, align 4, !llfi_index !138
  %174 = load i32* @rows, align 4, !llfi_index !139
  %175 = icmp slt i32 %173, %174, !llfi_index !140
  %176 = icmp slt i32 %173, %174, !llfi_index !140
  %check_cmp29 = icmp eq i1 %175, %176
  br i1 %check_cmp29, label %177, label %checkBb30

checkBb30:                                        ; preds = %172
  call void @check_flag()
  br label %177

; <label>:177                                     ; preds = %checkBb30, %172
  br i1 %175, label %178, label %222, !llfi_index !141

; <label>:178                                     ; preds = %177
  store i32 0, i32* %j3, align 4, !llfi_index !142
  br label %179, !llfi_index !143

; <label>:179                                     ; preds = %213, %178
  %180 = load i32* %j3, align 4, !llfi_index !144
  %181 = load i32* %j3, align 4, !llfi_index !144
  %182 = load i32* @cols, align 4, !llfi_index !145
  %183 = load i32* @cols, align 4, !llfi_index !145
  %184 = icmp slt i32 %180, %182, !llfi_index !146
  %185 = icmp slt i32 %181, %183, !llfi_index !146
  %check_cmp31 = icmp eq i1 %184, %185
  br i1 %check_cmp31, label %186, label %checkBb32

checkBb32:                                        ; preds = %179
  call void @check_flag()
  br label %186

; <label>:186                                     ; preds = %checkBb32, %179
  br i1 %184, label %187, label %214, !llfi_index !147

; <label>:187                                     ; preds = %186
  %188 = load i32* %j3, align 4, !llfi_index !148
  %189 = load i32* %j3, align 4, !llfi_index !148
  %190 = sext i32 %188 to i64, !llfi_index !149
  %191 = sext i32 %189 to i64, !llfi_index !149
  %192 = load i32* %i2, align 4, !llfi_index !150
  %193 = load i32* %i2, align 4, !llfi_index !150
  %194 = sext i32 %192 to i64, !llfi_index !151
  %195 = sext i32 %193 to i64, !llfi_index !151
  %196 = load i32*** @wall, align 8, !llfi_index !152
  %197 = load i32*** @wall, align 8, !llfi_index !152
  %198 = getelementptr inbounds i32** %196, i64 %194, !llfi_index !153
  %199 = getelementptr inbounds i32** %197, i64 %195, !llfi_index !153
  %200 = load i32** %198, align 8, !llfi_index !154
  %201 = load i32** %199, align 8, !llfi_index !154
  %202 = getelementptr inbounds i32* %200, i64 %190, !llfi_index !155
  %203 = getelementptr inbounds i32* %201, i64 %191, !llfi_index !155
  %204 = load i32* %202, align 4, !llfi_index !156
  %205 = load i32* %203, align 4, !llfi_index !156
  %check_cmp33 = icmp eq i32 %204, %205
  br i1 %check_cmp33, label %206, label %checkBb34

checkBb34:                                        ; preds = %187
  call void @check_flag()
  br label %206

; <label>:206                                     ; preds = %checkBb34, %187
  %207 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i32 0, i32 0), i32 %204), !llfi_index !157
  br label %208, !llfi_index !158

; <label>:208                                     ; preds = %206
  %209 = load i32* %j3, align 4, !llfi_index !159
  %210 = load i32* %j3, align 4, !llfi_index !159
  %211 = add nsw i32 %209, 1, !llfi_index !160
  %212 = add nsw i32 %210, 1, !llfi_index !160
  %check_cmp35 = icmp eq i32 %211, %212
  br i1 %check_cmp35, label %213, label %checkBb36

checkBb36:                                        ; preds = %208
  call void @check_flag()
  br label %213

; <label>:213                                     ; preds = %checkBb36, %208
  store i32 %211, i32* %j3, align 4, !llfi_index !161
  br label %179, !llfi_index !162

; <label>:214                                     ; preds = %186
  %215 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !llfi_index !163
  br label %216, !llfi_index !164

; <label>:216                                     ; preds = %214
  %217 = load i32* %i2, align 4, !llfi_index !165
  %218 = load i32* %i2, align 4, !llfi_index !165
  %219 = add nsw i32 %217, 1, !llfi_index !166
  %220 = add nsw i32 %218, 1, !llfi_index !166
  %check_cmp37 = icmp eq i32 %219, %220
  br i1 %check_cmp37, label %221, label %checkBb38

checkBb38:                                        ; preds = %216
  call void @check_flag()
  br label %221

; <label>:221                                     ; preds = %checkBb38, %216
  store i32 %219, i32* %i2, align 4, !llfi_index !167
  br label %172, !llfi_index !168

; <label>:222                                     ; preds = %177
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
  %4 = load i32** @result, align 8, !llfi_index !202
  %check_cmp = icmp eq i32* %3, %4
  br i1 %check_cmp, label %5, label %checkBb

checkBb:                                          ; preds = %0
  call void @check_flag()
  br label %5

; <label>:5                                       ; preds = %checkBb, %0
  store i32* %3, i32** %dst, align 8, !llfi_index !203
  %6 = load i32* @cols, align 4, !llfi_index !204
  %7 = sext i32 %6 to i64, !llfi_index !205
  %8 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %7, i64 4), !llfi_index !206
  %9 = extractvalue { i64, i1 } %8, 1, !llfi_index !207
  %10 = extractvalue { i64, i1 } %8, 0, !llfi_index !208
  %11 = select i1 %9, i64 -1, i64 %10, !llfi_index !209
  %12 = call noalias i8* @_Znam(i64 %11) #11, !llfi_index !210
  %13 = bitcast i8* %12 to i32*, !llfi_index !211
  store i32* %13, i32** %src, align 8, !llfi_index !212
  store i32 0, i32* %t, align 4, !llfi_index !213
  br label %14, !llfi_index !214

; <label>:14                                      ; preds = %182, %5
  %15 = load i32* %t, align 4, !llfi_index !215
  %16 = load i32* @rows, align 4, !llfi_index !216
  %17 = load i32* @rows, align 4, !llfi_index !216
  %check_cmp1 = icmp eq i32 %16, %17
  br i1 %check_cmp1, label %18, label %checkBb2

checkBb2:                                         ; preds = %14
  call void @check_flag()
  br label %18

; <label>:18                                      ; preds = %checkBb2, %14
  %19 = sub nsw i32 %16, 1, !llfi_index !217
  %20 = icmp slt i32 %15, %19, !llfi_index !218
  %21 = icmp slt i32 %15, %19, !llfi_index !218
  %check_cmp3 = icmp eq i1 %20, %21
  br i1 %check_cmp3, label %22, label %checkBb4

checkBb4:                                         ; preds = %18
  call void @check_flag()
  br label %22

; <label>:22                                      ; preds = %checkBb4, %18
  br i1 %20, label %23, label %183, !llfi_index !219

; <label>:23                                      ; preds = %22
  %24 = load i32** %src, align 8, !llfi_index !220
  store i32* %24, i32** %temp, align 8, !llfi_index !221
  %25 = load i32** %dst, align 8, !llfi_index !222
  %26 = load i32** %dst, align 8, !llfi_index !222
  %check_cmp5 = icmp eq i32* %25, %26
  br i1 %check_cmp5, label %27, label %checkBb6

checkBb6:                                         ; preds = %23
  call void @check_flag()
  br label %27

; <label>:27                                      ; preds = %checkBb6, %23
  store i32* %25, i32** %src, align 8, !llfi_index !223
  %28 = load i32** %temp, align 8, !llfi_index !224
  store i32* %28, i32** %dst, align 8, !llfi_index !225
  store i32 0, i32* %n, align 4, !llfi_index !226
  br label %29, !llfi_index !227

; <label>:29                                      ; preds = %175, %27
  %30 = load i32* %n, align 4, !llfi_index !228
  %31 = load i32* %n, align 4, !llfi_index !228
  %32 = load i32* @cols, align 4, !llfi_index !229
  %33 = load i32* @cols, align 4, !llfi_index !229
  %34 = icmp slt i32 %30, %32, !llfi_index !230
  %35 = icmp slt i32 %31, %33, !llfi_index !230
  %check_cmp7 = icmp eq i1 %34, %35
  br i1 %check_cmp7, label %36, label %checkBb8

checkBb8:                                         ; preds = %29
  call void @check_flag()
  br label %36

; <label>:36                                      ; preds = %checkBb8, %29
  br i1 %34, label %37, label %176, !llfi_index !231

; <label>:37                                      ; preds = %36
  %38 = load i32* %n, align 4, !llfi_index !232
  %39 = load i32* %n, align 4, !llfi_index !232
  %40 = sext i32 %38 to i64, !llfi_index !233
  %41 = sext i32 %39 to i64, !llfi_index !233
  %42 = load i32** %src, align 8, !llfi_index !234
  %43 = getelementptr inbounds i32* %42, i64 %40, !llfi_index !235
  %44 = getelementptr inbounds i32* %42, i64 %41, !llfi_index !235
  %45 = load i32* %43, align 4, !llfi_index !236
  %46 = load i32* %44, align 4, !llfi_index !236
  %check_cmp9 = icmp eq i32 %45, %46
  br i1 %check_cmp9, label %47, label %checkBb10

checkBb10:                                        ; preds = %37
  call void @check_flag()
  br label %47

; <label>:47                                      ; preds = %checkBb10, %37
  store i32 %45, i32* %min, align 4, !llfi_index !237
  %48 = load i32* %n, align 4, !llfi_index !238
  %49 = load i32* %n, align 4, !llfi_index !238
  %50 = icmp sgt i32 %48, 0, !llfi_index !239
  %51 = icmp sgt i32 %49, 0, !llfi_index !239
  %check_cmp11 = icmp eq i1 %50, %51
  br i1 %check_cmp11, label %52, label %checkBb12

checkBb12:                                        ; preds = %47
  call void @check_flag()
  br label %52

; <label>:52                                      ; preds = %checkBb12, %47
  br i1 %50, label %53, label %88, !llfi_index !240

; <label>:53                                      ; preds = %52
  %54 = load i32* %min, align 4, !llfi_index !241
  %55 = load i32* %min, align 4, !llfi_index !241
  %56 = load i32* %n, align 4, !llfi_index !242
  %57 = load i32* %n, align 4, !llfi_index !242
  %58 = sub nsw i32 %56, 1, !llfi_index !243
  %59 = sub nsw i32 %57, 1, !llfi_index !243
  %60 = sext i32 %58 to i64, !llfi_index !244
  %61 = sext i32 %59 to i64, !llfi_index !244
  %check_cmp13 = icmp eq i64 %60, %61
  br i1 %check_cmp13, label %62, label %checkBb14

checkBb14:                                        ; preds = %53
  call void @check_flag()
  br label %62

; <label>:62                                      ; preds = %checkBb14, %53
  %63 = load i32** %src, align 8, !llfi_index !245
  %64 = getelementptr inbounds i32* %63, i64 %60, !llfi_index !246
  %65 = load i32* %64, align 4, !llfi_index !247
  %66 = icmp sle i32 %54, %65, !llfi_index !248
  %67 = icmp sle i32 %55, %65, !llfi_index !248
  %check_cmp15 = icmp eq i1 %66, %67
  br i1 %check_cmp15, label %68, label %checkBb16

checkBb16:                                        ; preds = %62
  call void @check_flag()
  br label %68

; <label>:68                                      ; preds = %checkBb16, %62
  br i1 %66, label %69, label %73, !llfi_index !249

; <label>:69                                      ; preds = %68
  %70 = load i32* %min, align 4, !llfi_index !250
  %71 = load i32* %min, align 4, !llfi_index !250
  %check_cmp17 = icmp eq i32 %70, %71
  br i1 %check_cmp17, label %72, label %checkBb18

checkBb18:                                        ; preds = %69
  call void @check_flag()
  br label %72

; <label>:72                                      ; preds = %checkBb18, %69
  br label %86, !llfi_index !251

; <label>:73                                      ; preds = %68
  %74 = load i32* %n, align 4, !llfi_index !252
  %75 = load i32* %n, align 4, !llfi_index !252
  %76 = sub nsw i32 %74, 1, !llfi_index !253
  %77 = sub nsw i32 %75, 1, !llfi_index !253
  %78 = sext i32 %76 to i64, !llfi_index !254
  %79 = sext i32 %77 to i64, !llfi_index !254
  %80 = load i32** %src, align 8, !llfi_index !255
  %81 = getelementptr inbounds i32* %80, i64 %78, !llfi_index !256
  %82 = getelementptr inbounds i32* %80, i64 %79, !llfi_index !256
  %83 = load i32* %81, align 4, !llfi_index !257
  %84 = load i32* %82, align 4, !llfi_index !257
  %check_cmp19 = icmp eq i32 %83, %84
  br i1 %check_cmp19, label %85, label %checkBb20

checkBb20:                                        ; preds = %73
  call void @check_flag()
  br label %85

; <label>:85                                      ; preds = %checkBb20, %73
  br label %86, !llfi_index !258

; <label>:86                                      ; preds = %85, %72
  %87 = phi i32 [ %70, %72 ], [ %83, %85 ], !llfi_index !259
  store i32 %87, i32* %min, align 4, !llfi_index !260
  br label %88, !llfi_index !261

; <label>:88                                      ; preds = %86, %52
  %89 = load i32* %n, align 4, !llfi_index !262
  %90 = load i32* %n, align 4, !llfi_index !262
  %91 = load i32* @cols, align 4, !llfi_index !263
  %92 = load i32* @cols, align 4, !llfi_index !263
  %check_cmp21 = icmp eq i32 %91, %92
  br i1 %check_cmp21, label %93, label %checkBb22

checkBb22:                                        ; preds = %88
  call void @check_flag()
  br label %93

; <label>:93                                      ; preds = %checkBb22, %88
  %94 = sub nsw i32 %91, 1, !llfi_index !264
  %95 = icmp slt i32 %89, %94, !llfi_index !265
  %96 = icmp slt i32 %90, %94, !llfi_index !265
  %check_cmp23 = icmp eq i1 %95, %96
  br i1 %check_cmp23, label %97, label %checkBb24

checkBb24:                                        ; preds = %93
  call void @check_flag()
  br label %97

; <label>:97                                      ; preds = %checkBb24, %93
  br i1 %95, label %98, label %135, !llfi_index !266

; <label>:98                                      ; preds = %97
  %99 = load i32* %min, align 4, !llfi_index !267
  %100 = load i32* %n, align 4, !llfi_index !268
  %101 = load i32* %n, align 4, !llfi_index !268
  %check_cmp25 = icmp eq i32 %100, %101
  br i1 %check_cmp25, label %102, label %checkBb26

checkBb26:                                        ; preds = %98
  call void @check_flag()
  br label %102

; <label>:102                                     ; preds = %checkBb26, %98
  %103 = add nsw i32 %100, 1, !llfi_index !269
  %104 = sext i32 %103 to i64, !llfi_index !270
  %105 = sext i32 %103 to i64, !llfi_index !270
  %106 = load i32** %src, align 8, !llfi_index !271
  %107 = load i32** %src, align 8, !llfi_index !271
  %108 = getelementptr inbounds i32* %106, i64 %104, !llfi_index !272
  %109 = getelementptr inbounds i32* %107, i64 %105, !llfi_index !272
  %110 = load i32* %108, align 4, !llfi_index !273
  %111 = load i32* %109, align 4, !llfi_index !273
  %112 = icmp sle i32 %99, %110, !llfi_index !274
  %113 = icmp sle i32 %99, %111, !llfi_index !274
  %check_cmp27 = icmp eq i1 %112, %113
  br i1 %check_cmp27, label %114, label %checkBb28

checkBb28:                                        ; preds = %102
  call void @check_flag()
  br label %114

; <label>:114                                     ; preds = %checkBb28, %102
  br i1 %112, label %115, label %119, !llfi_index !275

; <label>:115                                     ; preds = %114
  %116 = load i32* %min, align 4, !llfi_index !276
  %117 = load i32* %min, align 4, !llfi_index !276
  %check_cmp29 = icmp eq i32 %116, %117
  br i1 %check_cmp29, label %118, label %checkBb30

checkBb30:                                        ; preds = %115
  call void @check_flag()
  br label %118

; <label>:118                                     ; preds = %checkBb30, %115
  br label %133, !llfi_index !277

; <label>:119                                     ; preds = %114
  %120 = load i32* %n, align 4, !llfi_index !278
  %121 = load i32* %n, align 4, !llfi_index !278
  %122 = add nsw i32 %120, 1, !llfi_index !279
  %123 = add nsw i32 %121, 1, !llfi_index !279
  %124 = sext i32 %122 to i64, !llfi_index !280
  %125 = sext i32 %123 to i64, !llfi_index !280
  %126 = load i32** %src, align 8, !llfi_index !281
  %127 = load i32** %src, align 8, !llfi_index !281
  %128 = getelementptr inbounds i32* %126, i64 %124, !llfi_index !282
  %129 = getelementptr inbounds i32* %127, i64 %125, !llfi_index !282
  %130 = load i32* %128, align 4, !llfi_index !283
  %131 = load i32* %129, align 4, !llfi_index !283
  %check_cmp31 = icmp eq i32 %130, %131
  br i1 %check_cmp31, label %132, label %checkBb32

checkBb32:                                        ; preds = %119
  call void @check_flag()
  br label %132

; <label>:132                                     ; preds = %checkBb32, %119
  br label %133, !llfi_index !284

; <label>:133                                     ; preds = %132, %118
  %134 = phi i32 [ %116, %118 ], [ %130, %132 ], !llfi_index !285
  store i32 %134, i32* %min, align 4, !llfi_index !286
  br label %135, !llfi_index !287

; <label>:135                                     ; preds = %133, %97
  %136 = load i32* %n, align 4, !llfi_index !288
  %137 = load i32* %n, align 4, !llfi_index !288
  %138 = sext i32 %136 to i64, !llfi_index !289
  %139 = sext i32 %137 to i64, !llfi_index !289
  %140 = load i32* %t, align 4, !llfi_index !290
  %141 = load i32* %t, align 4, !llfi_index !290
  %142 = add nsw i32 %140, 1, !llfi_index !291
  %143 = add nsw i32 %141, 1, !llfi_index !291
  %144 = sext i32 %142 to i64, !llfi_index !292
  %145 = sext i32 %143 to i64, !llfi_index !292
  %146 = load i32*** @wall, align 8, !llfi_index !293
  %147 = load i32*** @wall, align 8, !llfi_index !293
  %148 = getelementptr inbounds i32** %146, i64 %144, !llfi_index !294
  %149 = getelementptr inbounds i32** %147, i64 %145, !llfi_index !294
  %150 = load i32** %148, align 8, !llfi_index !295
  %151 = load i32** %149, align 8, !llfi_index !295
  %152 = getelementptr inbounds i32* %150, i64 %138, !llfi_index !296
  %153 = getelementptr inbounds i32* %151, i64 %139, !llfi_index !296
  %154 = load i32* %152, align 4, !llfi_index !297
  %155 = load i32* %153, align 4, !llfi_index !297
  %156 = load i32* %min, align 4, !llfi_index !298
  %157 = load i32* %min, align 4, !llfi_index !298
  %158 = add nsw i32 %154, %156, !llfi_index !299
  %159 = add nsw i32 %155, %157, !llfi_index !299
  %check_cmp33 = icmp eq i32 %158, %159
  br i1 %check_cmp33, label %160, label %checkBb34

checkBb34:                                        ; preds = %135
  call void @check_flag()
  br label %160

; <label>:160                                     ; preds = %checkBb34, %135
  %161 = load i32* %n, align 4, !llfi_index !300
  %162 = load i32* %n, align 4, !llfi_index !300
  %163 = sext i32 %161 to i64, !llfi_index !301
  %164 = sext i32 %162 to i64, !llfi_index !301
  %165 = load i32** %dst, align 8, !llfi_index !302
  %166 = load i32** %dst, align 8, !llfi_index !302
  %167 = getelementptr inbounds i32* %165, i64 %163, !llfi_index !303
  %168 = getelementptr inbounds i32* %166, i64 %164, !llfi_index !303
  %check_cmp35 = icmp eq i32* %167, %168
  br i1 %check_cmp35, label %169, label %checkBb36

checkBb36:                                        ; preds = %160
  call void @check_flag()
  br label %169

; <label>:169                                     ; preds = %checkBb36, %160
  store i32 %158, i32* %167, align 4, !llfi_index !304
  br label %170, !llfi_index !305

; <label>:170                                     ; preds = %169
  %171 = load i32* %n, align 4, !llfi_index !306
  %172 = load i32* %n, align 4, !llfi_index !306
  %173 = add nsw i32 %171, 1, !llfi_index !307
  %174 = add nsw i32 %172, 1, !llfi_index !307
  %check_cmp37 = icmp eq i32 %173, %174
  br i1 %check_cmp37, label %175, label %checkBb38

checkBb38:                                        ; preds = %170
  call void @check_flag()
  br label %175

; <label>:175                                     ; preds = %checkBb38, %170
  store i32 %173, i32* %n, align 4, !llfi_index !308
  br label %29, !llfi_index !309

; <label>:176                                     ; preds = %36
  br label %177, !llfi_index !310

; <label>:177                                     ; preds = %176
  %178 = load i32* %t, align 4, !llfi_index !311
  %179 = load i32* %t, align 4, !llfi_index !311
  %180 = add nsw i32 %178, 1, !llfi_index !312
  %181 = add nsw i32 %179, 1, !llfi_index !312
  %check_cmp39 = icmp eq i32 %180, %181
  br i1 %check_cmp39, label %182, label %checkBb40

checkBb40:                                        ; preds = %177
  call void @check_flag()
  br label %182

; <label>:182                                     ; preds = %checkBb40, %177
  store i32 %180, i32* %t, align 4, !llfi_index !313
  br label %14, !llfi_index !314

; <label>:183                                     ; preds = %22
  store i32 0, i32* %i, align 4, !llfi_index !315
  br label %184, !llfi_index !316

; <label>:184                                     ; preds = %210, %183
  %185 = load i32* %i, align 4, !llfi_index !317
  %186 = load i32* %i, align 4, !llfi_index !317
  %187 = load i32* @cols, align 4, !llfi_index !318
  %188 = load i32* @cols, align 4, !llfi_index !318
  %189 = icmp slt i32 %185, %187, !llfi_index !319
  %190 = icmp slt i32 %186, %188, !llfi_index !319
  %check_cmp41 = icmp eq i1 %189, %190
  br i1 %check_cmp41, label %191, label %checkBb42

checkBb42:                                        ; preds = %184
  call void @check_flag()
  br label %191

; <label>:191                                     ; preds = %checkBb42, %184
  br i1 %189, label %192, label %211, !llfi_index !320

; <label>:192                                     ; preds = %191
  %193 = load i32* %i, align 4, !llfi_index !321
  %194 = load i32* %i, align 4, !llfi_index !321
  %195 = sext i32 %193 to i64, !llfi_index !322
  %196 = sext i32 %194 to i64, !llfi_index !322
  %197 = load i32** @data, align 8, !llfi_index !323
  %198 = load i32** @data, align 8, !llfi_index !323
  %199 = getelementptr inbounds i32* %197, i64 %195, !llfi_index !324
  %200 = getelementptr inbounds i32* %198, i64 %196, !llfi_index !324
  %201 = load i32* %199, align 4, !llfi_index !325
  %202 = load i32* %200, align 4, !llfi_index !325
  %check_cmp43 = icmp eq i32 %201, %202
  br i1 %check_cmp43, label %203, label %checkBb44

checkBb44:                                        ; preds = %192
  call void @check_flag()
  br label %203

; <label>:203                                     ; preds = %checkBb44, %192
  %204 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i32 0, i32 0), i32 %201), !llfi_index !326
  br label %205, !llfi_index !327

; <label>:205                                     ; preds = %203
  %206 = load i32* %i, align 4, !llfi_index !328
  %207 = load i32* %i, align 4, !llfi_index !328
  %208 = add nsw i32 %206, 1, !llfi_index !329
  %209 = add nsw i32 %207, 1, !llfi_index !329
  %check_cmp45 = icmp eq i32 %208, %209
  br i1 %check_cmp45, label %210, label %checkBb46

checkBb46:                                        ; preds = %205
  call void @check_flag()
  br label %210

; <label>:210                                     ; preds = %checkBb46, %205
  store i32 %208, i32* %i, align 4, !llfi_index !330
  br label %184, !llfi_index !331

; <label>:211                                     ; preds = %191
  %212 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !llfi_index !332
  store i32 0, i32* %i1, align 4, !llfi_index !333
  br label %213, !llfi_index !334

; <label>:213                                     ; preds = %239, %211
  %214 = load i32* %i1, align 4, !llfi_index !335
  %215 = load i32* %i1, align 4, !llfi_index !335
  %216 = load i32* @cols, align 4, !llfi_index !336
  %217 = load i32* @cols, align 4, !llfi_index !336
  %218 = icmp slt i32 %214, %216, !llfi_index !337
  %219 = icmp slt i32 %215, %217, !llfi_index !337
  %check_cmp47 = icmp eq i1 %218, %219
  br i1 %check_cmp47, label %220, label %checkBb48

checkBb48:                                        ; preds = %213
  call void @check_flag()
  br label %220

; <label>:220                                     ; preds = %checkBb48, %213
  br i1 %218, label %221, label %240, !llfi_index !338

; <label>:221                                     ; preds = %220
  %222 = load i32* %i1, align 4, !llfi_index !339
  %223 = load i32* %i1, align 4, !llfi_index !339
  %224 = sext i32 %222 to i64, !llfi_index !340
  %225 = sext i32 %223 to i64, !llfi_index !340
  %226 = load i32** %dst, align 8, !llfi_index !341
  %227 = load i32** %dst, align 8, !llfi_index !341
  %228 = getelementptr inbounds i32* %226, i64 %224, !llfi_index !342
  %229 = getelementptr inbounds i32* %227, i64 %225, !llfi_index !342
  %230 = load i32* %228, align 4, !llfi_index !343
  %231 = load i32* %229, align 4, !llfi_index !343
  %check_cmp49 = icmp eq i32 %230, %231
  br i1 %check_cmp49, label %232, label %checkBb50

checkBb50:                                        ; preds = %221
  call void @check_flag()
  br label %232

; <label>:232                                     ; preds = %checkBb50, %221
  %233 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str12, i32 0, i32 0), i32 %230), !llfi_index !344
  br label %234, !llfi_index !345

; <label>:234                                     ; preds = %232
  %235 = load i32* %i1, align 4, !llfi_index !346
  %236 = load i32* %i1, align 4, !llfi_index !346
  %237 = add nsw i32 %235, 1, !llfi_index !347
  %238 = add nsw i32 %236, 1, !llfi_index !347
  %check_cmp51 = icmp eq i32 %237, %238
  br i1 %check_cmp51, label %239, label %checkBb52

checkBb52:                                        ; preds = %234
  call void @check_flag()
  br label %239

; <label>:239                                     ; preds = %checkBb52, %234
  store i32 %237, i32* %i1, align 4, !llfi_index !348
  br label %213, !llfi_index !349

; <label>:240                                     ; preds = %220
  %241 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !llfi_index !350
  %242 = load i32** @data, align 8, !llfi_index !351
  %243 = icmp eq i32* %242, null, !llfi_index !352
  br i1 %243, label %246, label %244, !llfi_index !353

; <label>:244                                     ; preds = %240
  %245 = bitcast i32* %242 to i8*, !llfi_index !354
  call void @_ZdaPv(i8* %245) #13, !llfi_index !355
  br label %246, !llfi_index !356

; <label>:246                                     ; preds = %244, %240
  %247 = load i32*** @wall, align 8, !llfi_index !357
  %248 = icmp eq i32** %247, null, !llfi_index !358
  br i1 %248, label %251, label %249, !llfi_index !359

; <label>:249                                     ; preds = %246
  %250 = bitcast i32** %247 to i8*, !llfi_index !360
  call void @_ZdaPv(i8* %250) #13, !llfi_index !361
  br label %251, !llfi_index !362

; <label>:251                                     ; preds = %249, %246
  %252 = load i32** %dst, align 8, !llfi_index !363
  %253 = icmp eq i32* %252, null, !llfi_index !364
  br i1 %253, label %256, label %254, !llfi_index !365

; <label>:254                                     ; preds = %251
  %255 = bitcast i32* %252 to i8*, !llfi_index !366
  call void @_ZdaPv(i8* %255) #13, !llfi_index !367
  br label %256, !llfi_index !368

; <label>:256                                     ; preds = %254, %251
  %257 = load i32** %src, align 8, !llfi_index !369
  %258 = icmp eq i32* %257, null, !llfi_index !370
  br i1 %258, label %261, label %259, !llfi_index !371

; <label>:259                                     ; preds = %256
  %260 = bitcast i32* %257 to i8*, !llfi_index !372
  call void @_ZdaPv(i8* %260) #13, !llfi_index !373
  br label %261, !llfi_index !374

; <label>:261                                     ; preds = %259, %256
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
