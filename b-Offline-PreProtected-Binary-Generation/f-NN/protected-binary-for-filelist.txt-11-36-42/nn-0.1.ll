; ModuleID = 'temp-unreadable.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.neighbor = type { [49 x i8], double }

@.str = private unnamed_addr constant [15 x i8] c"SDC DETECTED!\0A\00", align 1
@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [26 x i8] c"Invalid set of arguments\0A\00", align 1
@.str12 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str2 = private unnamed_addr constant [21 x i8] c"error opening flist\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"no room for neighbors\0A\00", align 1
@.str4 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str5 = private unnamed_addr constant [24 x i8] c"error reading filelist\0A\00", align 1
@.str6 = private unnamed_addr constant [20 x i8] c"error opening a db\0A\00", align 1
@.str7 = private unnamed_addr constant [6 x i8] c"Error\00", align 1
@.str8 = private unnamed_addr constant [8 x i8] c"%lf %lf\00", align 1
@.str9 = private unnamed_addr constant [11 x i8] c"output.txt\00", align 1
@.str10 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str11 = private unnamed_addr constant [31 x i8] c"The %d nearest neighbors are:\0A\00", align 1
@.str123 = private unnamed_addr constant [14 x i8] c"%s --> %.6lf\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @check_flag() #0 {
  %1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 99) #5
  unreachable
                                                  ; No predecessors!
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4, !llfi_index !1
  %2 = alloca i32, align 4, !llfi_index !2
  %3 = alloca i8**, align 8, !llfi_index !3
  %flist = alloca %struct._IO_FILE*, align 8, !llfi_index !4
  %fp = alloca %struct._IO_FILE*, align 8, !llfi_index !5
  %i = alloca i32, align 4, !llfi_index !6
  %j = alloca i32, align 4, !llfi_index !7
  %k = alloca i32, align 4, !llfi_index !8
  %rec_count = alloca i32, align 4, !llfi_index !9
  %done = alloca i32, align 4, !llfi_index !10
  %sandbox = alloca [490 x i8], align 16, !llfi_index !11
  %rec_iter = alloca i8*, align 8, !llfi_index !12
  %dbname = alloca [64 x i8], align 16, !llfi_index !13
  %neighbors = alloca %struct.neighbor*, align 8, !llfi_index !14
  %target_lat = alloca double, align 8, !llfi_index !15
  %target_long = alloca double, align 8, !llfi_index !16
  %tmp_lat = alloca double, align 8, !llfi_index !17
  %tmp_long = alloca double, align 8, !llfi_index !18
  %z = alloca double*, align 8, !llfi_index !19
  %max_dist = alloca double, align 8, !llfi_index !20
  %max_idx = alloca i32, align 4, !llfi_index !21
  %out = alloca %struct._IO_FILE*, align 8, !llfi_index !22
  store i32 0, i32* %1, !llfi_index !23
  store i32 %argc, i32* %2, align 4, !llfi_index !24
  store i8** %argv, i8*** %3, align 8, !llfi_index !25
  store i32 0, i32* %i, align 4, !llfi_index !26
  store i32 0, i32* %j, align 4, !llfi_index !27
  store i32 0, i32* %k, align 4, !llfi_index !28
  store i32 0, i32* %rec_count, align 4, !llfi_index !29
  store i32 0, i32* %done, align 4, !llfi_index !30
  store %struct.neighbor* null, %struct.neighbor** %neighbors, align 8, !llfi_index !31
  store double 0.000000e+00, double* %tmp_lat, align 8, !llfi_index !32
  store double 0.000000e+00, double* %tmp_long, align 8, !llfi_index !33
  %4 = load i32* %2, align 4, !llfi_index !34
  %5 = icmp slt i32 %4, 5, !llfi_index !35
  br i1 %5, label %6, label %9, !llfi_index !36

; <label>:6                                       ; preds = %0
  %7 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !37
  %8 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0)), !llfi_index !38
  call void @exit(i32 -1) #5, !llfi_index !39
  unreachable, !llfi_index !40

; <label>:9                                       ; preds = %0
  %10 = load i8*** %3, align 8, !llfi_index !41
  %11 = getelementptr inbounds i8** %10, i64 1, !llfi_index !42
  %12 = load i8** %11, align 8, !llfi_index !43
  %13 = call %struct._IO_FILE* @fopen(i8* %12, i8* getelementptr inbounds ([2 x i8]* @.str12, i32 0, i32 0)), !llfi_index !44
  store %struct._IO_FILE* %13, %struct._IO_FILE** %flist, align 8, !llfi_index !45
  %14 = load %struct._IO_FILE** %flist, align 8, !llfi_index !46
  %15 = icmp ne %struct._IO_FILE* %14, null, !llfi_index !47
  br i1 %15, label %18, label %16, !llfi_index !48

; <label>:16                                      ; preds = %9
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str2, i32 0, i32 0)), !llfi_index !49
  call void @exit(i32 1) #5, !llfi_index !50
  unreachable, !llfi_index !51

; <label>:18                                      ; preds = %9
  %19 = load i8*** %3, align 8, !llfi_index !52
  %20 = getelementptr inbounds i8** %19, i64 2, !llfi_index !53
  %21 = load i8** %20, align 8, !llfi_index !54
  %22 = call i32 @atoi(i8* %21) #6, !llfi_index !55
  store i32 %22, i32* %k, align 4, !llfi_index !56
  %23 = load i8*** %3, align 8, !llfi_index !57
  %24 = getelementptr inbounds i8** %23, i64 3, !llfi_index !58
  %25 = load i8** %24, align 8, !llfi_index !59
  %26 = call double @atof(i8* %25) #6, !llfi_index !60
  store double %26, double* %target_lat, align 8, !llfi_index !61
  %27 = load i8*** %3, align 8, !llfi_index !62
  %28 = getelementptr inbounds i8** %27, i64 4, !llfi_index !63
  %29 = load i8** %28, align 8, !llfi_index !64
  %30 = call double @atof(i8* %29) #6, !llfi_index !65
  store double %30, double* %target_long, align 8, !llfi_index !66
  %31 = load i32* %k, align 4, !llfi_index !67
  %32 = sext i32 %31 to i64, !llfi_index !68
  %33 = mul i64 %32, 64, !llfi_index !69
  %34 = call noalias i8* @malloc(i64 %33) #7, !llfi_index !70
  %35 = bitcast i8* %34 to %struct.neighbor*, !llfi_index !71
  store %struct.neighbor* %35, %struct.neighbor** %neighbors, align 8, !llfi_index !72
  %36 = load %struct.neighbor** %neighbors, align 8, !llfi_index !73
  %37 = icmp eq %struct.neighbor* %36, null, !llfi_index !74
  br i1 %37, label %38, label %41, !llfi_index !75

; <label>:38                                      ; preds = %18
  %39 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !76
  %40 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0)), !llfi_index !77
  call void @exit(i32 0) #5, !llfi_index !78
  unreachable, !llfi_index !79

; <label>:41                                      ; preds = %18
  store i32 0, i32* %j, align 4, !llfi_index !80
  br label %42, !llfi_index !81

; <label>:42                                      ; preds = %52, %41
  %43 = load i32* %j, align 4, !llfi_index !82
  %44 = load i32* %k, align 4, !llfi_index !83
  %45 = icmp slt i32 %43, %44, !llfi_index !84
  br i1 %45, label %46, label %55, !llfi_index !85

; <label>:46                                      ; preds = %42
  %47 = load i32* %j, align 4, !llfi_index !86
  %48 = sext i32 %47 to i64, !llfi_index !87
  %49 = load %struct.neighbor** %neighbors, align 8, !llfi_index !88
  %50 = getelementptr inbounds %struct.neighbor* %49, i64 %48, !llfi_index !89
  %51 = getelementptr inbounds %struct.neighbor* %50, i32 0, i32 1, !llfi_index !90
  store double 1.000000e+04, double* %51, align 8, !llfi_index !91
  br label %52, !llfi_index !92

; <label>:52                                      ; preds = %46
  %53 = load i32* %j, align 4, !llfi_index !93
  %54 = add nsw i32 %53, 1, !llfi_index !94
  store i32 %54, i32* %j, align 4, !llfi_index !95
  br label %42, !llfi_index !96

; <label>:55                                      ; preds = %42
  %56 = load %struct._IO_FILE** %flist, align 8, !llfi_index !97
  %57 = getelementptr inbounds [64 x i8]* %dbname, i32 0, i32 0, !llfi_index !98
  %58 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i8* %57), !llfi_index !99
  %59 = icmp ne i32 %58, 1, !llfi_index !100
  br i1 %59, label %60, label %63, !llfi_index !101

; <label>:60                                      ; preds = %55
  %61 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !102
  %62 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %61, i8* getelementptr inbounds ([24 x i8]* @.str5, i32 0, i32 0)), !llfi_index !103
  call void @exit(i32 0) #5, !llfi_index !104
  unreachable, !llfi_index !105

; <label>:63                                      ; preds = %55
  %64 = getelementptr inbounds [64 x i8]* %dbname, i32 0, i32 0, !llfi_index !106
  %65 = call %struct._IO_FILE* @fopen(i8* %64, i8* getelementptr inbounds ([2 x i8]* @.str12, i32 0, i32 0)), !llfi_index !107
  store %struct._IO_FILE* %65, %struct._IO_FILE** %fp, align 8, !llfi_index !108
  %66 = load %struct._IO_FILE** %fp, align 8, !llfi_index !109
  %67 = icmp ne %struct._IO_FILE* %66, null, !llfi_index !110
  br i1 %67, label %70, label %68, !llfi_index !111

; <label>:68                                      ; preds = %63
  %69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str2, i32 0, i32 0)), !llfi_index !112
  call void @exit(i32 1) #5, !llfi_index !113
  unreachable, !llfi_index !114

; <label>:70                                      ; preds = %63
  %71 = call noalias i8* @malloc(i64 80) #7, !llfi_index !115
  %72 = bitcast i8* %71 to double*, !llfi_index !116
  store double* %72, double** %z, align 8, !llfi_index !117
  br label %73, !llfi_index !118

; <label>:73                                      ; preds = %246, %70
  %74 = load i32* %done, align 4, !llfi_index !119
  %75 = load i32* %done, align 4, !llfi_index !119
  %76 = icmp ne i32 %74, 0, !llfi_index !120
  %77 = icmp ne i32 %75, 0, !llfi_index !120
  %78 = xor i1 %76, true, !llfi_index !121
  %79 = xor i1 %77, true, !llfi_index !121
  %check_cmp = icmp eq i1 %78, %79
  br i1 %check_cmp, label %80, label %checkBb

checkBb:                                          ; preds = %73
  call void @check_flag()
  br label %80

; <label>:80                                      ; preds = %checkBb, %73
  br i1 %78, label %81, label %247, !llfi_index !122

; <label>:81                                      ; preds = %80
  %82 = getelementptr inbounds [490 x i8]* %sandbox, i32 0, i32 0, !llfi_index !123
  %83 = getelementptr inbounds [490 x i8]* %sandbox, i32 0, i32 0, !llfi_index !123
  %check_cmp1 = icmp eq i8* %82, %83
  br i1 %check_cmp1, label %84, label %checkBb2

checkBb2:                                         ; preds = %81
  call void @check_flag()
  br label %84

; <label>:84                                      ; preds = %checkBb2, %81
  %85 = load %struct._IO_FILE** %fp, align 8, !llfi_index !124
  %86 = call i64 @fread(i8* %82, i64 49, i64 10, %struct._IO_FILE* %85), !llfi_index !125
  %87 = trunc i64 %86 to i32, !llfi_index !126
  %88 = trunc i64 %86 to i32, !llfi_index !126
  %check_cmp3 = icmp eq i32 %87, %88
  br i1 %check_cmp3, label %89, label %checkBb4

checkBb4:                                         ; preds = %84
  call void @check_flag()
  br label %89

; <label>:89                                      ; preds = %checkBb4, %84
  store i32 %87, i32* %rec_count, align 4, !llfi_index !127
  %90 = load i32* %rec_count, align 4, !llfi_index !128
  %91 = load i32* %rec_count, align 4, !llfi_index !128
  %92 = icmp ne i32 %90, 10, !llfi_index !129
  %93 = icmp ne i32 %91, 10, !llfi_index !129
  %check_cmp5 = icmp eq i1 %92, %93
  br i1 %check_cmp5, label %94, label %checkBb6

checkBb6:                                         ; preds = %89
  call void @check_flag()
  br label %94

; <label>:94                                      ; preds = %checkBb6, %89
  br i1 %92, label %95, label %125, !llfi_index !130

; <label>:95                                      ; preds = %94
  %96 = load %struct._IO_FILE** %flist, align 8, !llfi_index !131
  %97 = call i32 @ferror(%struct._IO_FILE* %96) #7, !llfi_index !132
  %98 = icmp ne i32 %97, 0, !llfi_index !133
  br i1 %98, label %123, label %99, !llfi_index !134

; <label>:99                                      ; preds = %95
  %100 = load %struct._IO_FILE** %fp, align 8, !llfi_index !135
  %101 = call i32 @fclose(%struct._IO_FILE* %100), !llfi_index !136
  %102 = load %struct._IO_FILE** %flist, align 8, !llfi_index !137
  %103 = call i32 @feof(%struct._IO_FILE* %102) #7, !llfi_index !138
  %104 = icmp ne i32 %103, 0, !llfi_index !139
  br i1 %104, label %105, label %106, !llfi_index !140

; <label>:105                                     ; preds = %99
  store i32 1, i32* %done, align 4, !llfi_index !141
  br label %122, !llfi_index !142

; <label>:106                                     ; preds = %99
  %107 = load %struct._IO_FILE** %flist, align 8, !llfi_index !143
  %108 = getelementptr inbounds [64 x i8]* %dbname, i32 0, i32 0, !llfi_index !144
  %109 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %107, i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i8* %108), !llfi_index !145
  %110 = icmp ne i32 %109, 1, !llfi_index !146
  br i1 %110, label %111, label %114, !llfi_index !147

; <label>:111                                     ; preds = %106
  %112 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !148
  %113 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %112, i8* getelementptr inbounds ([24 x i8]* @.str5, i32 0, i32 0)), !llfi_index !149
  call void @exit(i32 0) #5, !llfi_index !150
  unreachable, !llfi_index !151

; <label>:114                                     ; preds = %106
  %115 = getelementptr inbounds [64 x i8]* %dbname, i32 0, i32 0, !llfi_index !152
  %116 = call %struct._IO_FILE* @fopen(i8* %115, i8* getelementptr inbounds ([2 x i8]* @.str12, i32 0, i32 0)), !llfi_index !153
  store %struct._IO_FILE* %116, %struct._IO_FILE** %fp, align 8, !llfi_index !154
  %117 = load %struct._IO_FILE** %fp, align 8, !llfi_index !155
  %118 = icmp ne %struct._IO_FILE* %117, null, !llfi_index !156
  br i1 %118, label %121, label %119, !llfi_index !157

; <label>:119                                     ; preds = %114
  %120 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str6, i32 0, i32 0)), !llfi_index !158
  call void @exit(i32 1) #5, !llfi_index !159
  unreachable, !llfi_index !160

; <label>:121                                     ; preds = %114
  br label %122, !llfi_index !161

; <label>:122                                     ; preds = %121, %105
  br label %124, !llfi_index !162

; <label>:123                                     ; preds = %95
  call void @perror(i8* getelementptr inbounds ([6 x i8]* @.str7, i32 0, i32 0)), !llfi_index !163
  call void @exit(i32 0) #5, !llfi_index !164
  unreachable, !llfi_index !165

; <label>:124                                     ; preds = %122
  br label %125, !llfi_index !166

; <label>:125                                     ; preds = %124, %94
  store i32 0, i32* %i, align 4, !llfi_index !167
  br label %126, !llfi_index !168

; <label>:126                                     ; preds = %162, %125
  %127 = load i32* %i, align 4, !llfi_index !169
  %128 = load i32* %rec_count, align 4, !llfi_index !170
  %129 = icmp slt i32 %127, %128, !llfi_index !171
  br i1 %129, label %130, label %165, !llfi_index !172

; <label>:130                                     ; preds = %126
  %131 = getelementptr inbounds [490 x i8]* %sandbox, i32 0, i32 0, !llfi_index !173
  %132 = load i32* %i, align 4, !llfi_index !174
  %133 = mul nsw i32 %132, 49, !llfi_index !175
  %134 = add nsw i32 %133, 28, !llfi_index !176
  %135 = sub nsw i32 %134, 1, !llfi_index !177
  %136 = sext i32 %135 to i64, !llfi_index !178
  %137 = getelementptr inbounds i8* %131, i64 %136, !llfi_index !179
  store i8* %137, i8** %rec_iter, align 8, !llfi_index !180
  %138 = load i8** %rec_iter, align 8, !llfi_index !181
  %139 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %138, i8* getelementptr inbounds ([8 x i8]* @.str8, i32 0, i32 0), double* %tmp_lat, double* %tmp_long) #7, !llfi_index !182
  %140 = load double* %tmp_lat, align 8, !llfi_index !183
  %141 = load double* %target_lat, align 8, !llfi_index !184
  %142 = fsub double %140, %141, !llfi_index !185
  %143 = load double* %tmp_lat, align 8, !llfi_index !186
  %144 = load double* %target_lat, align 8, !llfi_index !187
  %145 = fsub double %143, %144, !llfi_index !188
  %146 = fmul double %142, %145, !llfi_index !189
  %147 = load double* %tmp_long, align 8, !llfi_index !190
  %148 = load double* %target_long, align 8, !llfi_index !191
  %149 = fsub double %147, %148, !llfi_index !192
  %150 = load double* %tmp_long, align 8, !llfi_index !193
  %151 = load double* %target_long, align 8, !llfi_index !194
  %152 = fsub double %150, %151, !llfi_index !195
  %153 = fmul double %149, %152, !llfi_index !196
  %154 = fadd double %146, %153, !llfi_index !197
  %155 = fadd double %146, %153, !llfi_index !197
  %check_cmp7 = fcmp ueq double %154, %155
  br i1 %check_cmp7, label %156, label %checkBb8

checkBb8:                                         ; preds = %130
  call void @check_flag()
  br label %156

; <label>:156                                     ; preds = %checkBb8, %130
  %157 = call double @sqrt(double %154) #7, !llfi_index !198
  %158 = load i32* %i, align 4, !llfi_index !199
  %159 = sext i32 %158 to i64, !llfi_index !200
  %160 = load double** %z, align 8, !llfi_index !201
  %161 = getelementptr inbounds double* %160, i64 %159, !llfi_index !202
  store double %157, double* %161, align 8, !llfi_index !203
  br label %162, !llfi_index !204

; <label>:162                                     ; preds = %156
  %163 = load i32* %i, align 4, !llfi_index !205
  %164 = add nsw i32 %163, 1, !llfi_index !206
  store i32 %164, i32* %i, align 4, !llfi_index !207
  br label %126, !llfi_index !208

; <label>:165                                     ; preds = %126
  store i32 0, i32* %i, align 4, !llfi_index !209
  br label %166, !llfi_index !210

; <label>:166                                     ; preds = %243, %165
  %167 = load i32* %i, align 4, !llfi_index !211
  %168 = load i32* %rec_count, align 4, !llfi_index !212
  %169 = icmp slt i32 %167, %168, !llfi_index !213
  %170 = icmp slt i32 %167, %168, !llfi_index !213
  %check_cmp9 = icmp eq i1 %169, %170
  br i1 %check_cmp9, label %171, label %checkBb10

checkBb10:                                        ; preds = %166
  call void @check_flag()
  br label %171

; <label>:171                                     ; preds = %checkBb10, %166
  br i1 %169, label %172, label %246, !llfi_index !214

; <label>:172                                     ; preds = %171
  store double -1.000000e+00, double* %max_dist, align 8, !llfi_index !215
  store i32 0, i32* %max_idx, align 4, !llfi_index !216
  store i32 0, i32* %j, align 4, !llfi_index !217
  br label %173, !llfi_index !218

; <label>:173                                     ; preds = %195, %172
  %174 = load i32* %j, align 4, !llfi_index !219
  %175 = load i32* %k, align 4, !llfi_index !220
  %176 = icmp slt i32 %174, %175, !llfi_index !221
  br i1 %176, label %177, label %198, !llfi_index !222

; <label>:177                                     ; preds = %173
  %178 = load i32* %j, align 4, !llfi_index !223
  %179 = sext i32 %178 to i64, !llfi_index !224
  %180 = load %struct.neighbor** %neighbors, align 8, !llfi_index !225
  %181 = getelementptr inbounds %struct.neighbor* %180, i64 %179, !llfi_index !226
  %182 = getelementptr inbounds %struct.neighbor* %181, i32 0, i32 1, !llfi_index !227
  %183 = load double* %182, align 8, !llfi_index !228
  %184 = load double* %max_dist, align 8, !llfi_index !229
  %185 = fcmp ogt double %183, %184, !llfi_index !230
  br i1 %185, label %186, label %194, !llfi_index !231

; <label>:186                                     ; preds = %177
  %187 = load i32* %j, align 4, !llfi_index !232
  %188 = sext i32 %187 to i64, !llfi_index !233
  %189 = load %struct.neighbor** %neighbors, align 8, !llfi_index !234
  %190 = getelementptr inbounds %struct.neighbor* %189, i64 %188, !llfi_index !235
  %191 = getelementptr inbounds %struct.neighbor* %190, i32 0, i32 1, !llfi_index !236
  %192 = load double* %191, align 8, !llfi_index !237
  store double %192, double* %max_dist, align 8, !llfi_index !238
  %193 = load i32* %j, align 4, !llfi_index !239
  store i32 %193, i32* %max_idx, align 4, !llfi_index !240
  br label %194, !llfi_index !241

; <label>:194                                     ; preds = %186, %177
  br label %195, !llfi_index !242

; <label>:195                                     ; preds = %194
  %196 = load i32* %j, align 4, !llfi_index !243
  %197 = add nsw i32 %196, 1, !llfi_index !244
  store i32 %197, i32* %j, align 4, !llfi_index !245
  br label %173, !llfi_index !246

; <label>:198                                     ; preds = %173
  %199 = load i32* %i, align 4, !llfi_index !247
  %200 = sext i32 %199 to i64, !llfi_index !248
  %201 = load double** %z, align 8, !llfi_index !249
  %202 = getelementptr inbounds double* %201, i64 %200, !llfi_index !250
  %203 = load double* %202, align 8, !llfi_index !251
  %204 = load i32* %max_idx, align 4, !llfi_index !252
  %205 = sext i32 %204 to i64, !llfi_index !253
  %206 = load %struct.neighbor** %neighbors, align 8, !llfi_index !254
  %207 = getelementptr inbounds %struct.neighbor* %206, i64 %205, !llfi_index !255
  %208 = getelementptr inbounds %struct.neighbor* %207, i32 0, i32 1, !llfi_index !256
  %209 = load double* %208, align 8, !llfi_index !257
  %210 = fcmp olt double %203, %209, !llfi_index !258
  %211 = fcmp olt double %203, %209, !llfi_index !258
  %check_cmp11 = icmp eq i1 %210, %211
  br i1 %check_cmp11, label %212, label %checkBb12

checkBb12:                                        ; preds = %198
  call void @check_flag()
  br label %212

; <label>:212                                     ; preds = %checkBb12, %198
  br i1 %210, label %213, label %242, !llfi_index !259

; <label>:213                                     ; preds = %212
  %214 = load i32* %i, align 4, !llfi_index !260
  %215 = add nsw i32 %214, 1, !llfi_index !261
  %216 = mul nsw i32 %215, 49, !llfi_index !262
  %217 = sub nsw i32 %216, 1, !llfi_index !263
  %218 = sext i32 %217 to i64, !llfi_index !264
  %219 = getelementptr inbounds [490 x i8]* %sandbox, i32 0, i64 %218, !llfi_index !265
  store i8 0, i8* %219, align 1, !llfi_index !266
  %220 = load i32* %max_idx, align 4, !llfi_index !267
  %221 = sext i32 %220 to i64, !llfi_index !268
  %222 = load %struct.neighbor** %neighbors, align 8, !llfi_index !269
  %223 = getelementptr inbounds %struct.neighbor* %222, i64 %221, !llfi_index !270
  %224 = getelementptr inbounds %struct.neighbor* %223, i32 0, i32 0, !llfi_index !271
  %225 = getelementptr inbounds [49 x i8]* %224, i32 0, i32 0, !llfi_index !272
  %226 = getelementptr inbounds [490 x i8]* %sandbox, i32 0, i32 0, !llfi_index !273
  %227 = load i32* %i, align 4, !llfi_index !274
  %228 = mul nsw i32 %227, 49, !llfi_index !275
  %229 = sext i32 %228 to i64, !llfi_index !276
  %230 = getelementptr inbounds i8* %226, i64 %229, !llfi_index !277
  %231 = call i8* @strcpy(i8* %225, i8* %230) #7, !llfi_index !278
  %232 = load i32* %i, align 4, !llfi_index !279
  %233 = sext i32 %232 to i64, !llfi_index !280
  %234 = load double** %z, align 8, !llfi_index !281
  %235 = getelementptr inbounds double* %234, i64 %233, !llfi_index !282
  %236 = load double* %235, align 8, !llfi_index !283
  %237 = load i32* %max_idx, align 4, !llfi_index !284
  %238 = sext i32 %237 to i64, !llfi_index !285
  %239 = load %struct.neighbor** %neighbors, align 8, !llfi_index !286
  %240 = getelementptr inbounds %struct.neighbor* %239, i64 %238, !llfi_index !287
  %241 = getelementptr inbounds %struct.neighbor* %240, i32 0, i32 1, !llfi_index !288
  store double %236, double* %241, align 8, !llfi_index !289
  br label %242, !llfi_index !290

; <label>:242                                     ; preds = %213, %212
  br label %243, !llfi_index !291

; <label>:243                                     ; preds = %242
  %244 = load i32* %i, align 4, !llfi_index !292
  %245 = add nsw i32 %244, 1, !llfi_index !293
  store i32 %245, i32* %i, align 4, !llfi_index !294
  br label %166, !llfi_index !295

; <label>:246                                     ; preds = %171
  br label %73, !llfi_index !296

; <label>:247                                     ; preds = %80
  %248 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str10, i32 0, i32 0)), !llfi_index !297
  store %struct._IO_FILE* %248, %struct._IO_FILE** %out, align 8, !llfi_index !298
  %249 = load %struct._IO_FILE** %out, align 8, !llfi_index !299
  %250 = load i32* %k, align 4, !llfi_index !300
  %251 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %249, i8* getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %250), !llfi_index !301
  %252 = load i32* %k, align 4, !llfi_index !302
  %253 = sub nsw i32 %252, 1, !llfi_index !303
  store i32 %253, i32* %j, align 4, !llfi_index !304
  br label %254, !llfi_index !305

; <label>:254                                     ; preds = %289, %247
  %255 = load i32* %j, align 4, !llfi_index !306
  %256 = icmp sge i32 %255, 0, !llfi_index !307
  br i1 %256, label %257, label %292, !llfi_index !308

; <label>:257                                     ; preds = %254
  %258 = load i32* %j, align 4, !llfi_index !309
  %259 = sext i32 %258 to i64, !llfi_index !310
  %260 = load %struct.neighbor** %neighbors, align 8, !llfi_index !311
  %261 = getelementptr inbounds %struct.neighbor* %260, i64 %259, !llfi_index !312
  %262 = getelementptr inbounds %struct.neighbor* %261, i32 0, i32 1, !llfi_index !313
  %263 = load double* %262, align 8, !llfi_index !314
  %264 = fcmp ogt double %263, 1.000000e+04, !llfi_index !315
  br i1 %264, label %273, label %265, !llfi_index !316

; <label>:265                                     ; preds = %257
  %266 = load i32* %j, align 4, !llfi_index !317
  %267 = sext i32 %266 to i64, !llfi_index !318
  %268 = load %struct.neighbor** %neighbors, align 8, !llfi_index !319
  %269 = getelementptr inbounds %struct.neighbor* %268, i64 %267, !llfi_index !320
  %270 = getelementptr inbounds %struct.neighbor* %269, i32 0, i32 1, !llfi_index !321
  %271 = load double* %270, align 8, !llfi_index !322
  %272 = fcmp olt double %271, 1.000000e+04, !llfi_index !323
  br i1 %272, label %273, label %288, !llfi_index !324

; <label>:273                                     ; preds = %265, %257
  %274 = load %struct._IO_FILE** %out, align 8, !llfi_index !325
  %275 = load i32* %j, align 4, !llfi_index !326
  %276 = sext i32 %275 to i64, !llfi_index !327
  %277 = load %struct.neighbor** %neighbors, align 8, !llfi_index !328
  %278 = getelementptr inbounds %struct.neighbor* %277, i64 %276, !llfi_index !329
  %279 = getelementptr inbounds %struct.neighbor* %278, i32 0, i32 0, !llfi_index !330
  %280 = getelementptr inbounds [49 x i8]* %279, i32 0, i32 0, !llfi_index !331
  %281 = load i32* %j, align 4, !llfi_index !332
  %282 = sext i32 %281 to i64, !llfi_index !333
  %283 = load %struct.neighbor** %neighbors, align 8, !llfi_index !334
  %284 = getelementptr inbounds %struct.neighbor* %283, i64 %282, !llfi_index !335
  %285 = getelementptr inbounds %struct.neighbor* %284, i32 0, i32 1, !llfi_index !336
  %286 = load double* %285, align 8, !llfi_index !337
  %287 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %274, i8* getelementptr inbounds ([14 x i8]* @.str123, i32 0, i32 0), i8* %280, double %286), !llfi_index !338
  br label %288, !llfi_index !339

; <label>:288                                     ; preds = %273, %265
  br label %289, !llfi_index !340

; <label>:289                                     ; preds = %288
  %290 = load i32* %j, align 4, !llfi_index !341
  %291 = add nsw i32 %290, -1, !llfi_index !342
  store i32 %291, i32* %j, align 4, !llfi_index !343
  br label %254, !llfi_index !344

; <label>:292                                     ; preds = %254
  %293 = load %struct._IO_FILE** %out, align 8, !llfi_index !345
  %294 = call i32 @fclose(%struct._IO_FILE* %293), !llfi_index !346
  %295 = load %struct._IO_FILE** %flist, align 8, !llfi_index !347
  %296 = call i32 @fclose(%struct._IO_FILE* %295), !llfi_index !348
  ret i32 0, !llfi_index !349
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #3

; Function Attrs: nounwind readonly
declare double @atof(i8*) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #1

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i32 @ferror(%struct._IO_FILE*) #4

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i32 @feof(%struct._IO_FILE*) #4

declare void @perror(i8*) #1

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(i8*, i8*, ...) #4

; Function Attrs: nounwind
declare double @sqrt(double) #4

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #4

declare void @dumpIndex(i64)

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind readonly }
attributes #7 = { nounwind }

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
