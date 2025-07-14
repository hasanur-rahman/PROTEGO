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

; <label>:73                                      ; preds = %245, %70
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
  br i1 %78, label %81, label %246, !llfi_index !122

; <label>:81                                      ; preds = %80
  %82 = getelementptr inbounds [490 x i8]* %sandbox, i32 0, i32 0, !llfi_index !123
  %83 = load %struct._IO_FILE** %fp, align 8, !llfi_index !124
  %84 = call i64 @fread(i8* %82, i64 49, i64 10, %struct._IO_FILE* %83), !llfi_index !125
  %85 = trunc i64 %84 to i32, !llfi_index !126
  %86 = trunc i64 %84 to i32, !llfi_index !126
  %check_cmp1 = icmp eq i32 %85, %86
  br i1 %check_cmp1, label %87, label %checkBb2

checkBb2:                                         ; preds = %81
  call void @check_flag()
  br label %87

; <label>:87                                      ; preds = %checkBb2, %81
  store i32 %85, i32* %rec_count, align 4, !llfi_index !127
  %88 = load i32* %rec_count, align 4, !llfi_index !128
  %89 = load i32* %rec_count, align 4, !llfi_index !128
  %90 = icmp ne i32 %88, 10, !llfi_index !129
  %91 = icmp ne i32 %89, 10, !llfi_index !129
  %check_cmp3 = icmp eq i1 %90, %91
  br i1 %check_cmp3, label %92, label %checkBb4

checkBb4:                                         ; preds = %87
  call void @check_flag()
  br label %92

; <label>:92                                      ; preds = %checkBb4, %87
  br i1 %90, label %93, label %123, !llfi_index !130

; <label>:93                                      ; preds = %92
  %94 = load %struct._IO_FILE** %flist, align 8, !llfi_index !131
  %95 = call i32 @ferror(%struct._IO_FILE* %94) #7, !llfi_index !132
  %96 = icmp ne i32 %95, 0, !llfi_index !133
  br i1 %96, label %121, label %97, !llfi_index !134

; <label>:97                                      ; preds = %93
  %98 = load %struct._IO_FILE** %fp, align 8, !llfi_index !135
  %99 = call i32 @fclose(%struct._IO_FILE* %98), !llfi_index !136
  %100 = load %struct._IO_FILE** %flist, align 8, !llfi_index !137
  %101 = call i32 @feof(%struct._IO_FILE* %100) #7, !llfi_index !138
  %102 = icmp ne i32 %101, 0, !llfi_index !139
  br i1 %102, label %103, label %104, !llfi_index !140

; <label>:103                                     ; preds = %97
  store i32 1, i32* %done, align 4, !llfi_index !141
  br label %120, !llfi_index !142

; <label>:104                                     ; preds = %97
  %105 = load %struct._IO_FILE** %flist, align 8, !llfi_index !143
  %106 = getelementptr inbounds [64 x i8]* %dbname, i32 0, i32 0, !llfi_index !144
  %107 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %105, i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i8* %106), !llfi_index !145
  %108 = icmp ne i32 %107, 1, !llfi_index !146
  br i1 %108, label %109, label %112, !llfi_index !147

; <label>:109                                     ; preds = %104
  %110 = load %struct._IO_FILE** @stderr, align 8, !llfi_index !148
  %111 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %110, i8* getelementptr inbounds ([24 x i8]* @.str5, i32 0, i32 0)), !llfi_index !149
  call void @exit(i32 0) #5, !llfi_index !150
  unreachable, !llfi_index !151

; <label>:112                                     ; preds = %104
  %113 = getelementptr inbounds [64 x i8]* %dbname, i32 0, i32 0, !llfi_index !152
  %114 = call %struct._IO_FILE* @fopen(i8* %113, i8* getelementptr inbounds ([2 x i8]* @.str12, i32 0, i32 0)), !llfi_index !153
  store %struct._IO_FILE* %114, %struct._IO_FILE** %fp, align 8, !llfi_index !154
  %115 = load %struct._IO_FILE** %fp, align 8, !llfi_index !155
  %116 = icmp ne %struct._IO_FILE* %115, null, !llfi_index !156
  br i1 %116, label %119, label %117, !llfi_index !157

; <label>:117                                     ; preds = %112
  %118 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str6, i32 0, i32 0)), !llfi_index !158
  call void @exit(i32 1) #5, !llfi_index !159
  unreachable, !llfi_index !160

; <label>:119                                     ; preds = %112
  br label %120, !llfi_index !161

; <label>:120                                     ; preds = %119, %103
  br label %122, !llfi_index !162

; <label>:121                                     ; preds = %93
  call void @perror(i8* getelementptr inbounds ([6 x i8]* @.str7, i32 0, i32 0)), !llfi_index !163
  call void @exit(i32 0) #5, !llfi_index !164
  unreachable, !llfi_index !165

; <label>:122                                     ; preds = %120
  br label %123, !llfi_index !166

; <label>:123                                     ; preds = %122, %92
  store i32 0, i32* %i, align 4, !llfi_index !167
  br label %124, !llfi_index !168

; <label>:124                                     ; preds = %160, %123
  %125 = load i32* %i, align 4, !llfi_index !169
  %126 = load i32* %rec_count, align 4, !llfi_index !170
  %127 = icmp slt i32 %125, %126, !llfi_index !171
  br i1 %127, label %128, label %163, !llfi_index !172

; <label>:128                                     ; preds = %124
  %129 = getelementptr inbounds [490 x i8]* %sandbox, i32 0, i32 0, !llfi_index !173
  %130 = load i32* %i, align 4, !llfi_index !174
  %131 = mul nsw i32 %130, 49, !llfi_index !175
  %132 = add nsw i32 %131, 28, !llfi_index !176
  %133 = sub nsw i32 %132, 1, !llfi_index !177
  %134 = sext i32 %133 to i64, !llfi_index !178
  %135 = getelementptr inbounds i8* %129, i64 %134, !llfi_index !179
  store i8* %135, i8** %rec_iter, align 8, !llfi_index !180
  %136 = load i8** %rec_iter, align 8, !llfi_index !181
  %137 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %136, i8* getelementptr inbounds ([8 x i8]* @.str8, i32 0, i32 0), double* %tmp_lat, double* %tmp_long) #7, !llfi_index !182
  %138 = load double* %tmp_lat, align 8, !llfi_index !183
  %139 = load double* %target_lat, align 8, !llfi_index !184
  %140 = fsub double %138, %139, !llfi_index !185
  %141 = load double* %tmp_lat, align 8, !llfi_index !186
  %142 = load double* %target_lat, align 8, !llfi_index !187
  %143 = fsub double %141, %142, !llfi_index !188
  %144 = fsub double %141, %142, !llfi_index !188
  %check_cmp5 = fcmp ueq double %143, %144
  br i1 %check_cmp5, label %145, label %checkBb6

checkBb6:                                         ; preds = %128
  call void @check_flag()
  br label %145

; <label>:145                                     ; preds = %checkBb6, %128
  %146 = fmul double %140, %143, !llfi_index !189
  %147 = load double* %tmp_long, align 8, !llfi_index !190
  %148 = load double* %target_long, align 8, !llfi_index !191
  %149 = fsub double %147, %148, !llfi_index !192
  %150 = load double* %tmp_long, align 8, !llfi_index !193
  %151 = load double* %target_long, align 8, !llfi_index !194
  %152 = fsub double %150, %151, !llfi_index !195
  %153 = fmul double %149, %152, !llfi_index !196
  %154 = fadd double %146, %153, !llfi_index !197
  %155 = call double @sqrt(double %154) #7, !llfi_index !198
  %156 = load i32* %i, align 4, !llfi_index !199
  %157 = sext i32 %156 to i64, !llfi_index !200
  %158 = load double** %z, align 8, !llfi_index !201
  %159 = getelementptr inbounds double* %158, i64 %157, !llfi_index !202
  store double %155, double* %159, align 8, !llfi_index !203
  br label %160, !llfi_index !204

; <label>:160                                     ; preds = %145
  %161 = load i32* %i, align 4, !llfi_index !205
  %162 = add nsw i32 %161, 1, !llfi_index !206
  store i32 %162, i32* %i, align 4, !llfi_index !207
  br label %124, !llfi_index !208

; <label>:163                                     ; preds = %124
  store i32 0, i32* %i, align 4, !llfi_index !209
  br label %164, !llfi_index !210

; <label>:164                                     ; preds = %242, %163
  %165 = load i32* %i, align 4, !llfi_index !211
  %166 = load i32* %rec_count, align 4, !llfi_index !212
  %167 = load i32* %rec_count, align 4, !llfi_index !212
  %168 = icmp slt i32 %165, %166, !llfi_index !213
  %169 = icmp slt i32 %165, %167, !llfi_index !213
  %check_cmp7 = icmp eq i1 %168, %169
  br i1 %check_cmp7, label %170, label %checkBb8

checkBb8:                                         ; preds = %164
  call void @check_flag()
  br label %170

; <label>:170                                     ; preds = %checkBb8, %164
  br i1 %168, label %171, label %245, !llfi_index !214

; <label>:171                                     ; preds = %170
  store double -1.000000e+00, double* %max_dist, align 8, !llfi_index !215
  store i32 0, i32* %max_idx, align 4, !llfi_index !216
  store i32 0, i32* %j, align 4, !llfi_index !217
  br label %172, !llfi_index !218

; <label>:172                                     ; preds = %194, %171
  %173 = load i32* %j, align 4, !llfi_index !219
  %174 = load i32* %k, align 4, !llfi_index !220
  %175 = icmp slt i32 %173, %174, !llfi_index !221
  br i1 %175, label %176, label %197, !llfi_index !222

; <label>:176                                     ; preds = %172
  %177 = load i32* %j, align 4, !llfi_index !223
  %178 = sext i32 %177 to i64, !llfi_index !224
  %179 = load %struct.neighbor** %neighbors, align 8, !llfi_index !225
  %180 = getelementptr inbounds %struct.neighbor* %179, i64 %178, !llfi_index !226
  %181 = getelementptr inbounds %struct.neighbor* %180, i32 0, i32 1, !llfi_index !227
  %182 = load double* %181, align 8, !llfi_index !228
  %183 = load double* %max_dist, align 8, !llfi_index !229
  %184 = fcmp ogt double %182, %183, !llfi_index !230
  br i1 %184, label %185, label %193, !llfi_index !231

; <label>:185                                     ; preds = %176
  %186 = load i32* %j, align 4, !llfi_index !232
  %187 = sext i32 %186 to i64, !llfi_index !233
  %188 = load %struct.neighbor** %neighbors, align 8, !llfi_index !234
  %189 = getelementptr inbounds %struct.neighbor* %188, i64 %187, !llfi_index !235
  %190 = getelementptr inbounds %struct.neighbor* %189, i32 0, i32 1, !llfi_index !236
  %191 = load double* %190, align 8, !llfi_index !237
  store double %191, double* %max_dist, align 8, !llfi_index !238
  %192 = load i32* %j, align 4, !llfi_index !239
  store i32 %192, i32* %max_idx, align 4, !llfi_index !240
  br label %193, !llfi_index !241

; <label>:193                                     ; preds = %185, %176
  br label %194, !llfi_index !242

; <label>:194                                     ; preds = %193
  %195 = load i32* %j, align 4, !llfi_index !243
  %196 = add nsw i32 %195, 1, !llfi_index !244
  store i32 %196, i32* %j, align 4, !llfi_index !245
  br label %172, !llfi_index !246

; <label>:197                                     ; preds = %172
  %198 = load i32* %i, align 4, !llfi_index !247
  %199 = sext i32 %198 to i64, !llfi_index !248
  %200 = sext i32 %198 to i64, !llfi_index !248
  %check_cmp9 = icmp eq i64 %199, %200
  br i1 %check_cmp9, label %201, label %checkBb10

checkBb10:                                        ; preds = %197
  call void @check_flag()
  br label %201

; <label>:201                                     ; preds = %checkBb10, %197
  %202 = load double** %z, align 8, !llfi_index !249
  %203 = getelementptr inbounds double* %202, i64 %199, !llfi_index !250
  %204 = load double* %203, align 8, !llfi_index !251
  %205 = load i32* %max_idx, align 4, !llfi_index !252
  %206 = sext i32 %205 to i64, !llfi_index !253
  %207 = load %struct.neighbor** %neighbors, align 8, !llfi_index !254
  %208 = getelementptr inbounds %struct.neighbor* %207, i64 %206, !llfi_index !255
  %209 = getelementptr inbounds %struct.neighbor* %208, i32 0, i32 1, !llfi_index !256
  %210 = load double* %209, align 8, !llfi_index !257
  %211 = fcmp olt double %204, %210, !llfi_index !258
  br i1 %211, label %212, label %241, !llfi_index !259

; <label>:212                                     ; preds = %201
  %213 = load i32* %i, align 4, !llfi_index !260
  %214 = add nsw i32 %213, 1, !llfi_index !261
  %215 = mul nsw i32 %214, 49, !llfi_index !262
  %216 = sub nsw i32 %215, 1, !llfi_index !263
  %217 = sext i32 %216 to i64, !llfi_index !264
  %218 = getelementptr inbounds [490 x i8]* %sandbox, i32 0, i64 %217, !llfi_index !265
  store i8 0, i8* %218, align 1, !llfi_index !266
  %219 = load i32* %max_idx, align 4, !llfi_index !267
  %220 = sext i32 %219 to i64, !llfi_index !268
  %221 = load %struct.neighbor** %neighbors, align 8, !llfi_index !269
  %222 = getelementptr inbounds %struct.neighbor* %221, i64 %220, !llfi_index !270
  %223 = getelementptr inbounds %struct.neighbor* %222, i32 0, i32 0, !llfi_index !271
  %224 = getelementptr inbounds [49 x i8]* %223, i32 0, i32 0, !llfi_index !272
  %225 = getelementptr inbounds [490 x i8]* %sandbox, i32 0, i32 0, !llfi_index !273
  %226 = load i32* %i, align 4, !llfi_index !274
  %227 = mul nsw i32 %226, 49, !llfi_index !275
  %228 = sext i32 %227 to i64, !llfi_index !276
  %229 = getelementptr inbounds i8* %225, i64 %228, !llfi_index !277
  %230 = call i8* @strcpy(i8* %224, i8* %229) #7, !llfi_index !278
  %231 = load i32* %i, align 4, !llfi_index !279
  %232 = sext i32 %231 to i64, !llfi_index !280
  %233 = load double** %z, align 8, !llfi_index !281
  %234 = getelementptr inbounds double* %233, i64 %232, !llfi_index !282
  %235 = load double* %234, align 8, !llfi_index !283
  %236 = load i32* %max_idx, align 4, !llfi_index !284
  %237 = sext i32 %236 to i64, !llfi_index !285
  %238 = load %struct.neighbor** %neighbors, align 8, !llfi_index !286
  %239 = getelementptr inbounds %struct.neighbor* %238, i64 %237, !llfi_index !287
  %240 = getelementptr inbounds %struct.neighbor* %239, i32 0, i32 1, !llfi_index !288
  store double %235, double* %240, align 8, !llfi_index !289
  br label %241, !llfi_index !290

; <label>:241                                     ; preds = %212, %201
  br label %242, !llfi_index !291

; <label>:242                                     ; preds = %241
  %243 = load i32* %i, align 4, !llfi_index !292
  %244 = add nsw i32 %243, 1, !llfi_index !293
  store i32 %244, i32* %i, align 4, !llfi_index !294
  br label %164, !llfi_index !295

; <label>:245                                     ; preds = %170
  br label %73, !llfi_index !296

; <label>:246                                     ; preds = %80
  %247 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str10, i32 0, i32 0)), !llfi_index !297
  store %struct._IO_FILE* %247, %struct._IO_FILE** %out, align 8, !llfi_index !298
  %248 = load %struct._IO_FILE** %out, align 8, !llfi_index !299
  %249 = load i32* %k, align 4, !llfi_index !300
  %250 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %248, i8* getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %249), !llfi_index !301
  %251 = load i32* %k, align 4, !llfi_index !302
  %252 = sub nsw i32 %251, 1, !llfi_index !303
  store i32 %252, i32* %j, align 4, !llfi_index !304
  br label %253, !llfi_index !305

; <label>:253                                     ; preds = %288, %246
  %254 = load i32* %j, align 4, !llfi_index !306
  %255 = icmp sge i32 %254, 0, !llfi_index !307
  br i1 %255, label %256, label %291, !llfi_index !308

; <label>:256                                     ; preds = %253
  %257 = load i32* %j, align 4, !llfi_index !309
  %258 = sext i32 %257 to i64, !llfi_index !310
  %259 = load %struct.neighbor** %neighbors, align 8, !llfi_index !311
  %260 = getelementptr inbounds %struct.neighbor* %259, i64 %258, !llfi_index !312
  %261 = getelementptr inbounds %struct.neighbor* %260, i32 0, i32 1, !llfi_index !313
  %262 = load double* %261, align 8, !llfi_index !314
  %263 = fcmp ogt double %262, 1.000000e+04, !llfi_index !315
  br i1 %263, label %272, label %264, !llfi_index !316

; <label>:264                                     ; preds = %256
  %265 = load i32* %j, align 4, !llfi_index !317
  %266 = sext i32 %265 to i64, !llfi_index !318
  %267 = load %struct.neighbor** %neighbors, align 8, !llfi_index !319
  %268 = getelementptr inbounds %struct.neighbor* %267, i64 %266, !llfi_index !320
  %269 = getelementptr inbounds %struct.neighbor* %268, i32 0, i32 1, !llfi_index !321
  %270 = load double* %269, align 8, !llfi_index !322
  %271 = fcmp olt double %270, 1.000000e+04, !llfi_index !323
  br i1 %271, label %272, label %287, !llfi_index !324

; <label>:272                                     ; preds = %264, %256
  %273 = load %struct._IO_FILE** %out, align 8, !llfi_index !325
  %274 = load i32* %j, align 4, !llfi_index !326
  %275 = sext i32 %274 to i64, !llfi_index !327
  %276 = load %struct.neighbor** %neighbors, align 8, !llfi_index !328
  %277 = getelementptr inbounds %struct.neighbor* %276, i64 %275, !llfi_index !329
  %278 = getelementptr inbounds %struct.neighbor* %277, i32 0, i32 0, !llfi_index !330
  %279 = getelementptr inbounds [49 x i8]* %278, i32 0, i32 0, !llfi_index !331
  %280 = load i32* %j, align 4, !llfi_index !332
  %281 = sext i32 %280 to i64, !llfi_index !333
  %282 = load %struct.neighbor** %neighbors, align 8, !llfi_index !334
  %283 = getelementptr inbounds %struct.neighbor* %282, i64 %281, !llfi_index !335
  %284 = getelementptr inbounds %struct.neighbor* %283, i32 0, i32 1, !llfi_index !336
  %285 = load double* %284, align 8, !llfi_index !337
  %286 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %273, i8* getelementptr inbounds ([14 x i8]* @.str123, i32 0, i32 0), i8* %279, double %285), !llfi_index !338
  br label %287, !llfi_index !339

; <label>:287                                     ; preds = %272, %264
  br label %288, !llfi_index !340

; <label>:288                                     ; preds = %287
  %289 = load i32* %j, align 4, !llfi_index !341
  %290 = add nsw i32 %289, -1, !llfi_index !342
  store i32 %290, i32* %j, align 4, !llfi_index !343
  br label %253, !llfi_index !344

; <label>:291                                     ; preds = %253
  %292 = load %struct._IO_FILE** %out, align 8, !llfi_index !345
  %293 = call i32 @fclose(%struct._IO_FILE* %292), !llfi_index !346
  %294 = load %struct._IO_FILE** %flist, align 8, !llfi_index !347
  %295 = call i32 @fclose(%struct._IO_FILE* %294), !llfi_index !348
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
