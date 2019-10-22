; ModuleID = 'xdp_prog_kern.c'
source_filename = "xdp_prog_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.bpf_map_def = type { i32, i32, i32, i32, i32, i32, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

@counter = global %struct.bpf_map_def { i32 2, i32 4, i32 4, i32 10, i32 0, i32 0, i32 0 }, section "maps", align 4, !dbg !0
@tx_port = global %struct.bpf_map_def { i32 14, i32 4, i32 4, i32 10, i32 0, i32 0, i32 0 }, section "maps", align 4, !dbg !9
@xdp_pass_func.____fmt = private unnamed_addr constant [5 x i8] c"\09%d\0A\00", align 1
@_license = global [4 x i8] c"GPL\00", section "license", align 1, !dbg !22
@llvm.used = appending global [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* bitcast (%struct.bpf_map_def* @tx_port to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass_func to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define i32 @xdp_pass_func(%struct.xdp_md* nocapture readonly) #0 section "xdp_pass" !dbg !50 {
  %2 = alloca i32, align 4
  %3 = alloca [5 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !65, metadata !DIExpression()), !dbg !104
  %4 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !105
  %5 = load i32, i32* %4, align 4, !dbg !105, !tbaa !106
  %6 = zext i32 %5 to i64, !dbg !111
  %7 = inttoptr i64 %6 to i8*, !dbg !112
  call void @llvm.dbg.value(metadata i8* %7, metadata !66, metadata !DIExpression()), !dbg !113
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !114
  %9 = load i32, i32* %8, align 4, !dbg !114, !tbaa !115
  %10 = zext i32 %9 to i64, !dbg !116
  %11 = inttoptr i64 %10 to i8*, !dbg !117
  call void @llvm.dbg.value(metadata i8* %11, metadata !67, metadata !DIExpression()), !dbg !118
  %12 = inttoptr i64 %6 to %struct.ethhdr*, !dbg !119
  call void @llvm.dbg.value(metadata %struct.ethhdr* %12, metadata !68, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.value(metadata i64 14, metadata !84, metadata !DIExpression()), !dbg !121
  %13 = getelementptr i8, i8* %7, i64 14, !dbg !122
  %14 = icmp ugt i8* %13, %11, !dbg !124
  br i1 %14, label %70, label %15, !dbg !125

; <label>:15:                                     ; preds = %1
  %16 = bitcast i32* %2 to i8*, !dbg !126
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %16) #3, !dbg !126
  call void @llvm.dbg.value(metadata i32 0, metadata !87, metadata !DIExpression()), !dbg !127
  store i32 0, i32* %2, align 4, !dbg !127, !tbaa !128
  call void @llvm.dbg.value(metadata i32 15, metadata !90, metadata !DIExpression()), !dbg !129
  %17 = getelementptr inbounds [5 x i8], [5 x i8]* %3, i64 0, i64 0
  call void @llvm.dbg.value(metadata i32 15, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 15, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 15, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 15, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 15, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 15, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 15, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 15, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 15, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 15, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 15, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 15, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 15, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 15, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 15, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 15, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 15, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 15, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %17) #3, !dbg !131
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !95, metadata !DIExpression()), !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !131
  %18 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %17, i32 5, i32 15) #3, !dbg !131
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %17) #3, !dbg !132
  %19 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %16) #3, !dbg !133
  call void @llvm.dbg.value(metadata i32 14, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata i32 14, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 14, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 14, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 14, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 14, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 14, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 14, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 14, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 14, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 14, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 14, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 14, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 14, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 14, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 14, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 14, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 14, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 14, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %17) #3, !dbg !131
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !95, metadata !DIExpression()), !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !131
  %20 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %17, i32 5, i32 14) #3, !dbg !131
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %17) #3, !dbg !132
  %21 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %16) #3, !dbg !133
  call void @llvm.dbg.value(metadata i32 13, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata i32 13, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 13, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 13, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 13, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 13, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 13, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 13, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 13, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 13, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 13, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 13, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 13, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 13, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 13, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 13, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 13, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 13, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 13, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %17) #3, !dbg !131
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !95, metadata !DIExpression()), !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !131
  %22 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %17, i32 5, i32 13) #3, !dbg !131
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %17) #3, !dbg !132
  %23 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %16) #3, !dbg !133
  call void @llvm.dbg.value(metadata i32 12, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata i32 12, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 12, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 12, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 12, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 12, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 12, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 12, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 12, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 12, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 12, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 12, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 12, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 12, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 12, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 12, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 12, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 12, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 12, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %17) #3, !dbg !131
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !95, metadata !DIExpression()), !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !131
  %24 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %17, i32 5, i32 12) #3, !dbg !131
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %17) #3, !dbg !132
  %25 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %16) #3, !dbg !133
  call void @llvm.dbg.value(metadata i32 11, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata i32 11, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 11, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 11, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 11, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 11, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 11, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 11, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 11, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 11, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 11, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 11, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 11, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 11, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 11, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 11, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 11, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 11, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 11, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %17) #3, !dbg !131
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !95, metadata !DIExpression()), !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !131
  %26 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %17, i32 5, i32 11) #3, !dbg !131
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %17) #3, !dbg !132
  %27 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %16) #3, !dbg !133
  call void @llvm.dbg.value(metadata i32 10, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata i32 10, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 10, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 10, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 10, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 10, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 10, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 10, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 10, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 10, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 10, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 10, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 10, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 10, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 10, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 10, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 10, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 10, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 10, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %17) #3, !dbg !131
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !95, metadata !DIExpression()), !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !131
  %28 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %17, i32 5, i32 10) #3, !dbg !131
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %17) #3, !dbg !132
  %29 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %16) #3, !dbg !133
  call void @llvm.dbg.value(metadata i32 9, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata i32 9, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 9, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 9, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 9, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 9, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 9, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 9, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 9, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 9, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 9, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 9, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 9, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 9, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 9, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 9, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 9, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 9, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 9, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %17) #3, !dbg !131
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !95, metadata !DIExpression()), !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !131
  %30 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %17, i32 5, i32 9) #3, !dbg !131
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %17) #3, !dbg !132
  %31 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %16) #3, !dbg !133
  call void @llvm.dbg.value(metadata i32 8, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata i32 8, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 8, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 8, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 8, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 8, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 8, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 8, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 8, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 8, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 8, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 8, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 8, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 8, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 8, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 8, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 8, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 8, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 8, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %17) #3, !dbg !131
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !95, metadata !DIExpression()), !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !131
  %32 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %17, i32 5, i32 8) #3, !dbg !131
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %17) #3, !dbg !132
  %33 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %16) #3, !dbg !133
  call void @llvm.dbg.value(metadata i32 7, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata i32 7, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 7, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 7, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 7, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 7, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 7, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 7, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 7, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 7, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 7, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 7, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 7, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 7, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 7, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 7, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 7, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 7, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 7, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %17) #3, !dbg !131
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !95, metadata !DIExpression()), !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !131
  %34 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %17, i32 5, i32 7) #3, !dbg !131
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %17) #3, !dbg !132
  %35 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %16) #3, !dbg !133
  call void @llvm.dbg.value(metadata i32 6, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata i32 6, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 6, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 6, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 6, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 6, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 6, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 6, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 6, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 6, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 6, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 6, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 6, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 6, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 6, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 6, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 6, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 6, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 6, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %17) #3, !dbg !131
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !95, metadata !DIExpression()), !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !131
  %36 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %17, i32 5, i32 6) #3, !dbg !131
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %17) #3, !dbg !132
  %37 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %16) #3, !dbg !133
  call void @llvm.dbg.value(metadata i32 5, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata i32 5, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 5, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 5, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 5, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 5, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 5, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 5, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 5, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 5, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 5, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 5, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 5, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 5, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 5, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 5, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 5, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 5, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 5, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %17) #3, !dbg !131
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !95, metadata !DIExpression()), !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !131
  %38 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %17, i32 5, i32 5) #3, !dbg !131
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %17) #3, !dbg !132
  %39 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %16) #3, !dbg !133
  call void @llvm.dbg.value(metadata i32 4, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata i32 4, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 4, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 4, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 4, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 4, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 4, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 4, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 4, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 4, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 4, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 4, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 4, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 4, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 4, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 4, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 4, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 4, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 4, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %17) #3, !dbg !131
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !95, metadata !DIExpression()), !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !131
  %40 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %17, i32 5, i32 4) #3, !dbg !131
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %17) #3, !dbg !132
  %41 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %16) #3, !dbg !133
  call void @llvm.dbg.value(metadata i32 3, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata i32 3, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 3, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 3, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 3, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 3, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 3, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 3, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 3, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 3, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 3, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 3, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 3, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 3, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 3, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 3, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 3, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 3, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 3, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %17) #3, !dbg !131
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !95, metadata !DIExpression()), !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !131
  %42 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %17, i32 5, i32 3) #3, !dbg !131
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %17) #3, !dbg !132
  %43 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %16) #3, !dbg !133
  call void @llvm.dbg.value(metadata i32 2, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata i32 2, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 2, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 2, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 2, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 2, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 2, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 2, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 2, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 2, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 2, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 2, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 2, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 2, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 2, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 2, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 2, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 2, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 2, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %17) #3, !dbg !131
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !95, metadata !DIExpression()), !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !131
  %44 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %17, i32 5, i32 2) #3, !dbg !131
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %17) #3, !dbg !132
  %45 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %16) #3, !dbg !133
  call void @llvm.dbg.value(metadata i32 1, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata i32 1, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 1, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 1, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 1, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 1, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 1, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 1, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 1, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 1, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 1, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 1, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 1, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 1, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 1, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 1, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 1, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 1, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 1, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %17) #3, !dbg !131
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !95, metadata !DIExpression()), !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !131
  %46 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %17, i32 5, i32 1) #3, !dbg !131
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %17) #3, !dbg !132
  %47 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %16) #3, !dbg !133
  call void @llvm.dbg.value(metadata i32 0, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata i32 0, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 0, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 0, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 0, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 0, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 0, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 0, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 0, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 0, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 0, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 0, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 0, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 0, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 0, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 0, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 0, metadata !92, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !130
  call void @llvm.dbg.value(metadata i32 0, metadata !92, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.value(metadata i32 0, metadata !90, metadata !DIExpression()), !dbg !129
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %17) #3, !dbg !131
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !95, metadata !DIExpression()), !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %17, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !131
  %48 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %17, i32 5, i32 0) #3, !dbg !131
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %17) #3, !dbg !132
  %49 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %16) #3, !dbg !133
  call void @llvm.dbg.value(metadata i32 -1, metadata !90, metadata !DIExpression()), !dbg !129
  %50 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %16) #3, !dbg !134
  %51 = bitcast i8* %50 to i32*, !dbg !134
  call void @llvm.dbg.value(metadata i32* %51, metadata !88, metadata !DIExpression()), !dbg !135
  %52 = icmp eq i8* %50, null, !dbg !136
  br i1 %52, label %56, label %53, !dbg !138

; <label>:53:                                     ; preds = %15
  %54 = load i32, i32* %51, align 4, !dbg !139, !tbaa !128
  %55 = add nsw i32 %54, 1, !dbg !139
  store i32 %55, i32* %51, align 4, !dbg !139, !tbaa !128
  br label %56, !dbg !141

; <label>:56:                                     ; preds = %15, %53
  call void @llvm.dbg.value(metadata i8 -32, metadata !103, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !142
  call void @llvm.dbg.value(metadata i8 12, metadata !100, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !143
  call void @llvm.dbg.value(metadata i8 -43, metadata !103, metadata !DIExpression(DW_OP_LLVM_fragment, 8, 8)), !dbg !142
  call void @llvm.dbg.value(metadata i8 84, metadata !100, metadata !DIExpression(DW_OP_LLVM_fragment, 8, 8)), !dbg !143
  call void @llvm.dbg.value(metadata i8 94, metadata !103, metadata !DIExpression(DW_OP_LLVM_fragment, 16, 8)), !dbg !142
  call void @llvm.dbg.value(metadata i8 -91, metadata !100, metadata !DIExpression(DW_OP_LLVM_fragment, 16, 8)), !dbg !143
  call void @llvm.dbg.value(metadata i8 70, metadata !103, metadata !DIExpression(DW_OP_LLVM_fragment, 24, 8)), !dbg !142
  call void @llvm.dbg.value(metadata i8 22, metadata !100, metadata !DIExpression(DW_OP_LLVM_fragment, 24, 8)), !dbg !143
  call void @llvm.dbg.value(metadata i8 88, metadata !103, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 8)), !dbg !142
  call void @llvm.dbg.value(metadata i8 -49, metadata !100, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 8)), !dbg !143
  call void @llvm.dbg.value(metadata i8 -120, metadata !103, metadata !DIExpression(DW_OP_LLVM_fragment, 40, 8)), !dbg !142
  call void @llvm.dbg.value(metadata i8 39, metadata !100, metadata !DIExpression(DW_OP_LLVM_fragment, 40, 8)), !dbg !143
  %57 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 1, i64 0, !dbg !144
  store i8 -32, i8* %57, align 1, !dbg !144
  %58 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 1, i64 1, !dbg !144
  store i8 -43, i8* %58, align 1, !dbg !144
  %59 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 1, i64 2, !dbg !144
  store i8 94, i8* %59, align 1, !dbg !144
  %60 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 1, i64 3, !dbg !144
  store i8 70, i8* %60, align 1, !dbg !144
  %61 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 1, i64 4, !dbg !144
  store i8 88, i8* %61, align 1, !dbg !144
  %62 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 1, i64 5, !dbg !144
  store i8 -120, i8* %62, align 1, !dbg !144
  %63 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 0, i64 0, !dbg !145
  store i8 12, i8* %63, align 1, !dbg !145
  %64 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 0, i64 1, !dbg !145
  store i8 84, i8* %64, align 1, !dbg !145
  %65 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 0, i64 2, !dbg !145
  store i8 -91, i8* %65, align 1, !dbg !145
  %66 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 0, i64 3, !dbg !145
  store i8 22, i8* %66, align 1, !dbg !145
  %67 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 0, i64 4, !dbg !145
  store i8 -49, i8* %67, align 1, !dbg !145
  %68 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 0, i64 5, !dbg !145
  store i8 39, i8* %68, align 1, !dbg !145
  %69 = call i32 inttoptr (i64 51 to i32 (i8*, i32, i32)*)(i8* bitcast (%struct.bpf_map_def* @tx_port to i8*), i32 3, i32 0) #3, !dbg !146
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %16) #3, !dbg !147
  br label %70

; <label>:70:                                     ; preds = %1, %56
  %71 = phi i32 [ %69, %56 ], [ 0, %1 ]
  ret i32 %71, !dbg !147
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!46, !47, !48}
!llvm.ident = !{!49}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "counter", scope: !2, file: !3, line: 16, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8)
!3 = !DIFile(filename: "xdp_prog_kern.c", directory: "/home/anuraag/mtp/proc_more/reverse/ingress-3-egress")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!8 = !{!0, !9, !22, !28, !36, !41}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "tx_port", scope: !2, file: !3, line: 24, type: !11, isLocal: false, isDefinition: true)
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !12, line: 210, size: 224, elements: !13)
!12 = !DIFile(filename: "../includes/headers/bpf_helpers.h", directory: "/home/anuraag/mtp/proc_more/reverse/ingress-3-egress")
!13 = !{!14, !16, !17, !18, !19, !20, !21}
!14 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !11, file: !12, line: 211, baseType: !15, size: 32)
!15 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !11, file: !12, line: 212, baseType: !15, size: 32, offset: 32)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !11, file: !12, line: 213, baseType: !15, size: 32, offset: 64)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !11, file: !12, line: 214, baseType: !15, size: 32, offset: 96)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !11, file: !12, line: 215, baseType: !15, size: 32, offset: 128)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "inner_map_idx", scope: !11, file: !12, line: 216, baseType: !15, size: 32, offset: 160)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "numa_node", scope: !11, file: !12, line: 217, baseType: !15, size: 32, offset: 192)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 78, type: !24, isLocal: false, isDefinition: true)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 32, elements: !26)
!25 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!26 = !{!27}
!27 = !DISubrange(count: 4)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !12, line: 38, type: !30, isLocal: true, isDefinition: true)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!31 = !DISubroutineType(types: !32)
!32 = !{!33, !34, !33, null}
!33 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !25)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !12, line: 20, type: !38, isLocal: true, isDefinition: true)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DISubroutineType(types: !40)
!40 = !{!6, !6, !6}
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(name: "bpf_redirect_map", scope: !2, file: !12, line: 57, type: !43, isLocal: true, isDefinition: true)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DISubroutineType(types: !45)
!45 = !{!33, !6, !33, !33}
!46 = !{i32 2, !"Dwarf Version", i32 4}
!47 = !{i32 2, !"Debug Info Version", i32 3}
!48 = !{i32 1, !"wchar_size", i32 4}
!49 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!50 = distinct !DISubprogram(name: "xdp_pass_func", scope: !3, file: !3, line: 32, type: !51, isLocal: false, isDefinition: true, scopeLine: 33, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !64)
!51 = !DISubroutineType(types: !52)
!52 = !{!33, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !55, line: 2856, size: 160, elements: !56)
!55 = !DIFile(filename: "../includes/headers/linux/bpf.h", directory: "/home/anuraag/mtp/proc_more/reverse/ingress-3-egress")
!56 = !{!57, !60, !61, !62, !63}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !54, file: !55, line: 2857, baseType: !58, size: 32)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !59, line: 27, baseType: !15)
!59 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "/home/anuraag/mtp/proc_more/reverse/ingress-3-egress")
!60 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !54, file: !55, line: 2858, baseType: !58, size: 32, offset: 32)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !54, file: !55, line: 2859, baseType: !58, size: 32, offset: 64)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !54, file: !55, line: 2861, baseType: !58, size: 32, offset: 96)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !54, file: !55, line: 2862, baseType: !58, size: 32, offset: 128)
!64 = !{!65, !66, !67, !68, !84, !87, !88, !90, !92, !95, !100, !103}
!65 = !DILocalVariable(name: "ctx", arg: 1, scope: !50, file: !3, line: 32, type: !53)
!66 = !DILocalVariable(name: "data", scope: !50, file: !3, line: 34, type: !6)
!67 = !DILocalVariable(name: "data_end", scope: !50, file: !3, line: 35, type: !6)
!68 = !DILocalVariable(name: "eth", scope: !50, file: !3, line: 36, type: !69)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !71, line: 159, size: 112, elements: !72)
!71 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "/home/anuraag/mtp/proc_more/reverse/ingress-3-egress")
!72 = !{!73, !78, !79}
!73 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !70, file: !71, line: 160, baseType: !74, size: 48)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !75, size: 48, elements: !76)
!75 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!76 = !{!77}
!77 = !DISubrange(count: 6)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !70, file: !71, line: 161, baseType: !74, size: 48, offset: 48)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !70, file: !71, line: 162, baseType: !80, size: 16, offset: 96)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !81, line: 25, baseType: !82)
!81 = !DIFile(filename: "/usr/include/linux/types.h", directory: "/home/anuraag/mtp/proc_more/reverse/ingress-3-egress")
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !59, line: 24, baseType: !83)
!83 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!84 = !DILocalVariable(name: "offset", scope: !50, file: !3, line: 37, type: !85)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !59, line: 31, baseType: !86)
!86 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!87 = !DILocalVariable(name: "key", scope: !50, file: !3, line: 42, type: !33)
!88 = !DILocalVariable(name: "val", scope: !50, file: !3, line: 43, type: !89)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!90 = !DILocalVariable(name: "temp", scope: !91, file: !3, line: 45, type: !33)
!91 = distinct !DILexicalBlock(scope: !50, file: !3, line: 45, column: 5)
!92 = !DILocalVariable(name: "waste", scope: !93, file: !3, line: 46, type: !33)
!93 = distinct !DILexicalBlock(scope: !94, file: !3, line: 45, column: 38)
!94 = distinct !DILexicalBlock(scope: !91, file: !3, line: 45, column: 5)
!95 = !DILocalVariable(name: "____fmt", scope: !96, file: !3, line: 51, type: !97)
!96 = distinct !DILexicalBlock(scope: !93, file: !3, line: 51, column: 3)
!97 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 40, elements: !98)
!98 = !{!99}
!99 = !DISubrange(count: 5)
!100 = !DILocalVariable(name: "dst", scope: !50, file: !3, line: 64, type: !101)
!101 = !DICompositeType(tag: DW_TAG_array_type, baseType: !102, size: 48, elements: !76)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !59, line: 21, baseType: !75)
!103 = !DILocalVariable(name: "src", scope: !50, file: !3, line: 64, type: !101)
!104 = !DILocation(line: 32, column: 35, scope: !50)
!105 = !DILocation(line: 34, column: 34, scope: !50)
!106 = !{!107, !108, i64 0}
!107 = !{!"xdp_md", !108, i64 0, !108, i64 4, !108, i64 8, !108, i64 12, !108, i64 16}
!108 = !{!"int", !109, i64 0}
!109 = !{!"omnipotent char", !110, i64 0}
!110 = !{!"Simple C/C++ TBAA"}
!111 = !DILocation(line: 34, column: 23, scope: !50)
!112 = !DILocation(line: 34, column: 15, scope: !50)
!113 = !DILocation(line: 34, column: 8, scope: !50)
!114 = !DILocation(line: 35, column: 38, scope: !50)
!115 = !{!107, !108, i64 4}
!116 = !DILocation(line: 35, column: 27, scope: !50)
!117 = !DILocation(line: 35, column: 19, scope: !50)
!118 = !DILocation(line: 35, column: 8, scope: !50)
!119 = !DILocation(line: 36, column: 23, scope: !50)
!120 = !DILocation(line: 36, column: 17, scope: !50)
!121 = !DILocation(line: 37, column: 8, scope: !50)
!122 = !DILocation(line: 39, column: 18, scope: !123)
!123 = distinct !DILexicalBlock(scope: !50, file: !3, line: 39, column: 6)
!124 = !DILocation(line: 39, column: 27, scope: !123)
!125 = !DILocation(line: 39, column: 6, scope: !50)
!126 = !DILocation(line: 42, column: 5, scope: !50)
!127 = !DILocation(line: 42, column: 9, scope: !50)
!128 = !{!108, !108, i64 0}
!129 = !DILocation(line: 45, column: 13, scope: !91)
!130 = !DILocation(line: 46, column: 7, scope: !93)
!131 = !DILocation(line: 51, column: 3, scope: !96)
!132 = !DILocation(line: 51, column: 3, scope: !93)
!133 = !DILocation(line: 52, column: 9, scope: !93)
!134 = !DILocation(line: 54, column: 10, scope: !50)
!135 = !DILocation(line: 43, column: 10, scope: !50)
!136 = !DILocation(line: 55, column: 8, scope: !137)
!137 = distinct !DILexicalBlock(scope: !50, file: !3, line: 55, column: 8)
!138 = !DILocation(line: 55, column: 8, scope: !50)
!139 = !DILocation(line: 56, column: 15, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !3, line: 55, column: 12)
!141 = !DILocation(line: 57, column: 5, scope: !140)
!142 = !DILocation(line: 64, column: 15, scope: !50)
!143 = !DILocation(line: 64, column: 7, scope: !50)
!144 = !DILocation(line: 72, column: 2, scope: !50)
!145 = !DILocation(line: 73, column: 2, scope: !50)
!146 = !DILocation(line: 75, column: 9, scope: !50)
!147 = !DILocation(line: 76, column: 1, scope: !50)
