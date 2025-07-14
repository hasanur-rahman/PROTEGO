; ModuleID = 'nn.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.neighbor = type { [49 x i8], double }

@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [26 x i8] c"Invalid set of arguments\0A\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
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
@.str12 = private unnamed_addr constant [14 x i8] c"%s --> %.6lf\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %flist = alloca %struct._IO_FILE*, align 8
  %fp = alloca %struct._IO_FILE*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %rec_count = alloca i32, align 4
  %done = alloca i32, align 4
  %sandbox = alloca [490 x i8], align 16
  %rec_iter = alloca i8*, align 8
  %dbname = alloca [64 x i8], align 16
  %neighbors = alloca %struct.neighbor*, align 8
  %target_lat = alloca double, align 8
  %target_long = alloca double, align 8
  %tmp_lat = alloca double, align 8
  %tmp_long = alloca double, align 8
  %z = alloca double*, align 8
  %max_dist = alloca double, align 8
  %max_idx = alloca i32, align 4
  %out = alloca %struct._IO_FILE*, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i32 0, i32* %i, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %k, align 4
  store i32 0, i32* %rec_count, align 4
  store i32 0, i32* %done, align 4
  store %struct.neighbor* null, %struct.neighbor** %neighbors, align 8
  store double 0.000000e+00, double* %tmp_lat, align 8
  store double 0.000000e+00, double* %tmp_long, align 8
  %4 = load i32* %2, align 4
  %5 = icmp slt i32 %4, 5
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load %struct._IO_FILE** @stderr, align 8
  %8 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([26 x i8]* @.str, i32 0, i32 0))
  call void @exit(i32 -1) #5
  unreachable

; <label>:9                                       ; preds = %0
  %10 = load i8*** %3, align 8
  %11 = getelementptr inbounds i8** %10, i64 1
  %12 = load i8** %11, align 8
  %13 = call %struct._IO_FILE* @fopen(i8* %12, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  store %struct._IO_FILE* %13, %struct._IO_FILE** %flist, align 8
  %14 = load %struct._IO_FILE** %flist, align 8
  %15 = icmp ne %struct._IO_FILE* %14, null
  br i1 %15, label %18, label %16

; <label>:16                                      ; preds = %9
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str2, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable

; <label>:18                                      ; preds = %9
  %19 = load i8*** %3, align 8
  %20 = getelementptr inbounds i8** %19, i64 2
  %21 = load i8** %20, align 8
  %22 = call i32 @atoi(i8* %21) #6
  store i32 %22, i32* %k, align 4
  %23 = load i8*** %3, align 8
  %24 = getelementptr inbounds i8** %23, i64 3
  %25 = load i8** %24, align 8
  %26 = call double @atof(i8* %25) #6
  store double %26, double* %target_lat, align 8
  %27 = load i8*** %3, align 8
  %28 = getelementptr inbounds i8** %27, i64 4
  %29 = load i8** %28, align 8
  %30 = call double @atof(i8* %29) #6
  store double %30, double* %target_long, align 8
  %31 = load i32* %k, align 4
  %32 = sext i32 %31 to i64
  %33 = mul i64 %32, 64
  %34 = call noalias i8* @malloc(i64 %33) #7
  %35 = bitcast i8* %34 to %struct.neighbor*
  store %struct.neighbor* %35, %struct.neighbor** %neighbors, align 8
  %36 = load %struct.neighbor** %neighbors, align 8
  %37 = icmp eq %struct.neighbor* %36, null
  br i1 %37, label %38, label %41

; <label>:38                                      ; preds = %18
  %39 = load %struct._IO_FILE** @stderr, align 8
  %40 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0))
  call void @exit(i32 0) #5
  unreachable

; <label>:41                                      ; preds = %18
  store i32 0, i32* %j, align 4
  br label %42

; <label>:42                                      ; preds = %52, %41
  %43 = load i32* %j, align 4
  %44 = load i32* %k, align 4
  %45 = icmp slt i32 %43, %44
  br i1 %45, label %46, label %55

; <label>:46                                      ; preds = %42
  %47 = load i32* %j, align 4
  %48 = sext i32 %47 to i64
  %49 = load %struct.neighbor** %neighbors, align 8
  %50 = getelementptr inbounds %struct.neighbor* %49, i64 %48
  %51 = getelementptr inbounds %struct.neighbor* %50, i32 0, i32 1
  store double 1.000000e+04, double* %51, align 8
  br label %52

; <label>:52                                      ; preds = %46
  %53 = load i32* %j, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %j, align 4
  br label %42

; <label>:55                                      ; preds = %42
  %56 = load %struct._IO_FILE** %flist, align 8
  %57 = getelementptr inbounds [64 x i8]* %dbname, i32 0, i32 0
  %58 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i8* %57)
  %59 = icmp ne i32 %58, 1
  br i1 %59, label %60, label %63

; <label>:60                                      ; preds = %55
  %61 = load %struct._IO_FILE** @stderr, align 8
  %62 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %61, i8* getelementptr inbounds ([24 x i8]* @.str5, i32 0, i32 0))
  call void @exit(i32 0) #5
  unreachable

; <label>:63                                      ; preds = %55
  %64 = getelementptr inbounds [64 x i8]* %dbname, i32 0, i32 0
  %65 = call %struct._IO_FILE* @fopen(i8* %64, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  store %struct._IO_FILE* %65, %struct._IO_FILE** %fp, align 8
  %66 = load %struct._IO_FILE** %fp, align 8
  %67 = icmp ne %struct._IO_FILE* %66, null
  br i1 %67, label %70, label %68

; <label>:68                                      ; preds = %63
  %69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str2, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable

; <label>:70                                      ; preds = %63
  %71 = call noalias i8* @malloc(i64 80) #7
  %72 = bitcast i8* %71 to double*
  store double* %72, double** %z, align 8
  br label %73

; <label>:73                                      ; preds = %229, %70
  %74 = load i32* %done, align 4
  %75 = icmp ne i32 %74, 0
  %76 = xor i1 %75, true
  br i1 %76, label %77, label %230

; <label>:77                                      ; preds = %73
  %78 = getelementptr inbounds [490 x i8]* %sandbox, i32 0, i32 0
  %79 = load %struct._IO_FILE** %fp, align 8
  %80 = call i64 @fread(i8* %78, i64 49, i64 10, %struct._IO_FILE* %79)
  %81 = trunc i64 %80 to i32
  store i32 %81, i32* %rec_count, align 4
  %82 = load i32* %rec_count, align 4
  %83 = icmp ne i32 %82, 10
  br i1 %83, label %84, label %114

; <label>:84                                      ; preds = %77
  %85 = load %struct._IO_FILE** %flist, align 8
  %86 = call i32 @ferror(%struct._IO_FILE* %85) #7
  %87 = icmp ne i32 %86, 0
  br i1 %87, label %112, label %88

; <label>:88                                      ; preds = %84
  %89 = load %struct._IO_FILE** %fp, align 8
  %90 = call i32 @fclose(%struct._IO_FILE* %89)
  %91 = load %struct._IO_FILE** %flist, align 8
  %92 = call i32 @feof(%struct._IO_FILE* %91) #7
  %93 = icmp ne i32 %92, 0
  br i1 %93, label %94, label %95

; <label>:94                                      ; preds = %88
  store i32 1, i32* %done, align 4
  br label %111

; <label>:95                                      ; preds = %88
  %96 = load %struct._IO_FILE** %flist, align 8
  %97 = getelementptr inbounds [64 x i8]* %dbname, i32 0, i32 0
  %98 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %96, i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), i8* %97)
  %99 = icmp ne i32 %98, 1
  br i1 %99, label %100, label %103

; <label>:100                                     ; preds = %95
  %101 = load %struct._IO_FILE** @stderr, align 8
  %102 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %101, i8* getelementptr inbounds ([24 x i8]* @.str5, i32 0, i32 0))
  call void @exit(i32 0) #5
  unreachable

; <label>:103                                     ; preds = %95
  %104 = getelementptr inbounds [64 x i8]* %dbname, i32 0, i32 0
  %105 = call %struct._IO_FILE* @fopen(i8* %104, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  store %struct._IO_FILE* %105, %struct._IO_FILE** %fp, align 8
  %106 = load %struct._IO_FILE** %fp, align 8
  %107 = icmp ne %struct._IO_FILE* %106, null
  br i1 %107, label %110, label %108

; <label>:108                                     ; preds = %103
  %109 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str6, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable

; <label>:110                                     ; preds = %103
  br label %111

; <label>:111                                     ; preds = %110, %94
  br label %113

; <label>:112                                     ; preds = %84
  call void @perror(i8* getelementptr inbounds ([6 x i8]* @.str7, i32 0, i32 0))
  call void @exit(i32 0) #5
  unreachable

; <label>:113                                     ; preds = %111
  br label %114

; <label>:114                                     ; preds = %113, %77
  store i32 0, i32* %i, align 4
  br label %115

; <label>:115                                     ; preds = %149, %114
  %116 = load i32* %i, align 4
  %117 = load i32* %rec_count, align 4
  %118 = icmp slt i32 %116, %117
  br i1 %118, label %119, label %152

; <label>:119                                     ; preds = %115
  %120 = getelementptr inbounds [490 x i8]* %sandbox, i32 0, i32 0
  %121 = load i32* %i, align 4
  %122 = mul nsw i32 %121, 49
  %123 = add nsw i32 %122, 28
  %124 = sub nsw i32 %123, 1
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i8* %120, i64 %125
  store i8* %126, i8** %rec_iter, align 8
  %127 = load i8** %rec_iter, align 8
  %128 = call i32 (i8*, i8*, ...)* @__isoc99_sscanf(i8* %127, i8* getelementptr inbounds ([8 x i8]* @.str8, i32 0, i32 0), double* %tmp_lat, double* %tmp_long) #7
  %129 = load double* %tmp_lat, align 8
  %130 = load double* %target_lat, align 8
  %131 = fsub double %129, %130
  %132 = load double* %tmp_lat, align 8
  %133 = load double* %target_lat, align 8
  %134 = fsub double %132, %133
  %135 = fmul double %131, %134
  %136 = load double* %tmp_long, align 8
  %137 = load double* %target_long, align 8
  %138 = fsub double %136, %137
  %139 = load double* %tmp_long, align 8
  %140 = load double* %target_long, align 8
  %141 = fsub double %139, %140
  %142 = fmul double %138, %141
  %143 = fadd double %135, %142
  %144 = call double @sqrt(double %143) #7
  %145 = load i32* %i, align 4
  %146 = sext i32 %145 to i64
  %147 = load double** %z, align 8
  %148 = getelementptr inbounds double* %147, i64 %146
  store double %144, double* %148, align 8
  br label %149

; <label>:149                                     ; preds = %119
  %150 = load i32* %i, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, i32* %i, align 4
  br label %115

; <label>:152                                     ; preds = %115
  store i32 0, i32* %i, align 4
  br label %153

; <label>:153                                     ; preds = %226, %152
  %154 = load i32* %i, align 4
  %155 = load i32* %rec_count, align 4
  %156 = icmp slt i32 %154, %155
  br i1 %156, label %157, label %229

; <label>:157                                     ; preds = %153
  store double -1.000000e+00, double* %max_dist, align 8
  store i32 0, i32* %max_idx, align 4
  store i32 0, i32* %j, align 4
  br label %158

; <label>:158                                     ; preds = %180, %157
  %159 = load i32* %j, align 4
  %160 = load i32* %k, align 4
  %161 = icmp slt i32 %159, %160
  br i1 %161, label %162, label %183

; <label>:162                                     ; preds = %158
  %163 = load i32* %j, align 4
  %164 = sext i32 %163 to i64
  %165 = load %struct.neighbor** %neighbors, align 8
  %166 = getelementptr inbounds %struct.neighbor* %165, i64 %164
  %167 = getelementptr inbounds %struct.neighbor* %166, i32 0, i32 1
  %168 = load double* %167, align 8
  %169 = load double* %max_dist, align 8
  %170 = fcmp ogt double %168, %169
  br i1 %170, label %171, label %179

; <label>:171                                     ; preds = %162
  %172 = load i32* %j, align 4
  %173 = sext i32 %172 to i64
  %174 = load %struct.neighbor** %neighbors, align 8
  %175 = getelementptr inbounds %struct.neighbor* %174, i64 %173
  %176 = getelementptr inbounds %struct.neighbor* %175, i32 0, i32 1
  %177 = load double* %176, align 8
  store double %177, double* %max_dist, align 8
  %178 = load i32* %j, align 4
  store i32 %178, i32* %max_idx, align 4
  br label %179

; <label>:179                                     ; preds = %171, %162
  br label %180

; <label>:180                                     ; preds = %179
  %181 = load i32* %j, align 4
  %182 = add nsw i32 %181, 1
  store i32 %182, i32* %j, align 4
  br label %158

; <label>:183                                     ; preds = %158
  %184 = load i32* %i, align 4
  %185 = sext i32 %184 to i64
  %186 = load double** %z, align 8
  %187 = getelementptr inbounds double* %186, i64 %185
  %188 = load double* %187, align 8
  %189 = load i32* %max_idx, align 4
  %190 = sext i32 %189 to i64
  %191 = load %struct.neighbor** %neighbors, align 8
  %192 = getelementptr inbounds %struct.neighbor* %191, i64 %190
  %193 = getelementptr inbounds %struct.neighbor* %192, i32 0, i32 1
  %194 = load double* %193, align 8
  %195 = fcmp olt double %188, %194
  br i1 %195, label %196, label %225

; <label>:196                                     ; preds = %183
  %197 = load i32* %i, align 4
  %198 = add nsw i32 %197, 1
  %199 = mul nsw i32 %198, 49
  %200 = sub nsw i32 %199, 1
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds [490 x i8]* %sandbox, i32 0, i64 %201
  store i8 0, i8* %202, align 1
  %203 = load i32* %max_idx, align 4
  %204 = sext i32 %203 to i64
  %205 = load %struct.neighbor** %neighbors, align 8
  %206 = getelementptr inbounds %struct.neighbor* %205, i64 %204
  %207 = getelementptr inbounds %struct.neighbor* %206, i32 0, i32 0
  %208 = getelementptr inbounds [49 x i8]* %207, i32 0, i32 0
  %209 = getelementptr inbounds [490 x i8]* %sandbox, i32 0, i32 0
  %210 = load i32* %i, align 4
  %211 = mul nsw i32 %210, 49
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds i8* %209, i64 %212
  %214 = call i8* @strcpy(i8* %208, i8* %213) #7
  %215 = load i32* %i, align 4
  %216 = sext i32 %215 to i64
  %217 = load double** %z, align 8
  %218 = getelementptr inbounds double* %217, i64 %216
  %219 = load double* %218, align 8
  %220 = load i32* %max_idx, align 4
  %221 = sext i32 %220 to i64
  %222 = load %struct.neighbor** %neighbors, align 8
  %223 = getelementptr inbounds %struct.neighbor* %222, i64 %221
  %224 = getelementptr inbounds %struct.neighbor* %223, i32 0, i32 1
  store double %219, double* %224, align 8
  br label %225

; <label>:225                                     ; preds = %196, %183
  br label %226

; <label>:226                                     ; preds = %225
  %227 = load i32* %i, align 4
  %228 = add nsw i32 %227, 1
  store i32 %228, i32* %i, align 4
  br label %153

; <label>:229                                     ; preds = %153
  br label %73

; <label>:230                                     ; preds = %73
  %231 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([11 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str10, i32 0, i32 0))
  store %struct._IO_FILE* %231, %struct._IO_FILE** %out, align 8
  %232 = load %struct._IO_FILE** %out, align 8
  %233 = load i32* %k, align 4
  %234 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %232, i8* getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %233)
  %235 = load i32* %k, align 4
  %236 = sub nsw i32 %235, 1
  store i32 %236, i32* %j, align 4
  br label %237

; <label>:237                                     ; preds = %272, %230
  %238 = load i32* %j, align 4
  %239 = icmp sge i32 %238, 0
  br i1 %239, label %240, label %275

; <label>:240                                     ; preds = %237
  %241 = load i32* %j, align 4
  %242 = sext i32 %241 to i64
  %243 = load %struct.neighbor** %neighbors, align 8
  %244 = getelementptr inbounds %struct.neighbor* %243, i64 %242
  %245 = getelementptr inbounds %struct.neighbor* %244, i32 0, i32 1
  %246 = load double* %245, align 8
  %247 = fcmp ogt double %246, 1.000000e+04
  br i1 %247, label %256, label %248

; <label>:248                                     ; preds = %240
  %249 = load i32* %j, align 4
  %250 = sext i32 %249 to i64
  %251 = load %struct.neighbor** %neighbors, align 8
  %252 = getelementptr inbounds %struct.neighbor* %251, i64 %250
  %253 = getelementptr inbounds %struct.neighbor* %252, i32 0, i32 1
  %254 = load double* %253, align 8
  %255 = fcmp olt double %254, 1.000000e+04
  br i1 %255, label %256, label %271

; <label>:256                                     ; preds = %248, %240
  %257 = load %struct._IO_FILE** %out, align 8
  %258 = load i32* %j, align 4
  %259 = sext i32 %258 to i64
  %260 = load %struct.neighbor** %neighbors, align 8
  %261 = getelementptr inbounds %struct.neighbor* %260, i64 %259
  %262 = getelementptr inbounds %struct.neighbor* %261, i32 0, i32 0
  %263 = getelementptr inbounds [49 x i8]* %262, i32 0, i32 0
  %264 = load i32* %j, align 4
  %265 = sext i32 %264 to i64
  %266 = load %struct.neighbor** %neighbors, align 8
  %267 = getelementptr inbounds %struct.neighbor* %266, i64 %265
  %268 = getelementptr inbounds %struct.neighbor* %267, i32 0, i32 1
  %269 = load double* %268, align 8
  %270 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %257, i8* getelementptr inbounds ([14 x i8]* @.str12, i32 0, i32 0), i8* %263, double %269)
  br label %271

; <label>:271                                     ; preds = %256, %248
  br label %272

; <label>:272                                     ; preds = %271
  %273 = load i32* %j, align 4
  %274 = add nsw i32 %273, -1
  store i32 %274, i32* %j, align 4
  br label %237

; <label>:275                                     ; preds = %237
  %276 = load %struct._IO_FILE** %out, align 8
  %277 = call i32 @fclose(%struct._IO_FILE* %276)
  %278 = load %struct._IO_FILE** %flist, align 8
  %279 = call i32 @fclose(%struct._IO_FILE* %278)
  ret i32 0
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @printf(i8*, ...) #1

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

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind readonly }
attributes #7 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.4 (tags/RELEASE_34/final)"}
