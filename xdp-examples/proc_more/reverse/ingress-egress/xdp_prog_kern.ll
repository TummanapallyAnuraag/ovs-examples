; ModuleID = 'xdp_prog_kern.c'
source_filename = "xdp_prog_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.bpf_map_def = type { i32, i32, i32, i32, i32, i32, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }

@counter = global %struct.bpf_map_def { i32 2, i32 4, i32 4, i32 10, i32 0, i32 0, i32 0 }, section "maps", align 4, !dbg !0
@xdp_pass_func.____fmt = private unnamed_addr constant [5 x i8] c"\09%d\0A\00", align 1
@_license = global [4 x i8] c"GPL\00", section "license", align 1, !dbg !14
@llvm.used = appending global [3 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass_func to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define i32 @xdp_pass_func(%struct.xdp_md* nocapture readnone) #0 section "xdp_pass" !dbg !49 {
  %2 = alloca i32, align 4
  %3 = alloca [5 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !63, metadata !DIExpression()), !dbg !77
  %4 = bitcast i32* %2 to i8*, !dbg !78
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #3, !dbg !78
  call void @llvm.dbg.value(metadata i32 0, metadata !64, metadata !DIExpression()), !dbg !79
  store i32 0, i32* %2, align 4, !dbg !79, !tbaa !80
  call void @llvm.dbg.value(metadata i32 15, metadata !67, metadata !DIExpression()), !dbg !84
  %5 = getelementptr inbounds [5 x i8], [5 x i8]* %3, i64 0, i64 0
  call void @llvm.dbg.value(metadata i32 15, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 15, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 15, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 15, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 15, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 15, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 15, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 15, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 15, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 15, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 15, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 15, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 15, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 15, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 15, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 15, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 15, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 15, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %5) #3, !dbg !86
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !72, metadata !DIExpression()), !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !86
  %6 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %5, i32 5, i32 15) #3, !dbg !86
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %5) #3, !dbg !87
  %7 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %4) #3, !dbg !88
  call void @llvm.dbg.value(metadata i32 14, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i32 14, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 14, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 14, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 14, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 14, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 14, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 14, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 14, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 14, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 14, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 14, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 14, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 14, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 14, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 14, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 14, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 14, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 14, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %5) #3, !dbg !86
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !72, metadata !DIExpression()), !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !86
  %8 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %5, i32 5, i32 14) #3, !dbg !86
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %5) #3, !dbg !87
  %9 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %4) #3, !dbg !88
  call void @llvm.dbg.value(metadata i32 13, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i32 13, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 13, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 13, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 13, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 13, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 13, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 13, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 13, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 13, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 13, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 13, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 13, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 13, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 13, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 13, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 13, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 13, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 13, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %5) #3, !dbg !86
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !72, metadata !DIExpression()), !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !86
  %10 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %5, i32 5, i32 13) #3, !dbg !86
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %5) #3, !dbg !87
  %11 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %4) #3, !dbg !88
  call void @llvm.dbg.value(metadata i32 12, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i32 12, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 12, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 12, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 12, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 12, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 12, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 12, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 12, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 12, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 12, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 12, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 12, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 12, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 12, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 12, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 12, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 12, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 12, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %5) #3, !dbg !86
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !72, metadata !DIExpression()), !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !86
  %12 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %5, i32 5, i32 12) #3, !dbg !86
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %5) #3, !dbg !87
  %13 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %4) #3, !dbg !88
  call void @llvm.dbg.value(metadata i32 11, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i32 11, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 11, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 11, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 11, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 11, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 11, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 11, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 11, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 11, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 11, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 11, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 11, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 11, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 11, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 11, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 11, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 11, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 11, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %5) #3, !dbg !86
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !72, metadata !DIExpression()), !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !86
  %14 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %5, i32 5, i32 11) #3, !dbg !86
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %5) #3, !dbg !87
  %15 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %4) #3, !dbg !88
  call void @llvm.dbg.value(metadata i32 10, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i32 10, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 10, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 10, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 10, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 10, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 10, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 10, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 10, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 10, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 10, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 10, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 10, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 10, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 10, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 10, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 10, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 10, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 10, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %5) #3, !dbg !86
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !72, metadata !DIExpression()), !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !86
  %16 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %5, i32 5, i32 10) #3, !dbg !86
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %5) #3, !dbg !87
  %17 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %4) #3, !dbg !88
  call void @llvm.dbg.value(metadata i32 9, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i32 9, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 9, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 9, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 9, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 9, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 9, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 9, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 9, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 9, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 9, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 9, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 9, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 9, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 9, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 9, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 9, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 9, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 9, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %5) #3, !dbg !86
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !72, metadata !DIExpression()), !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !86
  %18 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %5, i32 5, i32 9) #3, !dbg !86
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %5) #3, !dbg !87
  %19 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %4) #3, !dbg !88
  call void @llvm.dbg.value(metadata i32 8, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i32 8, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 8, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 8, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 8, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 8, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 8, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 8, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 8, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 8, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 8, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 8, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 8, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 8, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 8, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 8, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 8, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 8, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 8, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %5) #3, !dbg !86
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !72, metadata !DIExpression()), !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !86
  %20 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %5, i32 5, i32 8) #3, !dbg !86
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %5) #3, !dbg !87
  %21 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %4) #3, !dbg !88
  call void @llvm.dbg.value(metadata i32 7, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i32 7, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 7, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 7, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 7, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 7, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 7, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 7, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 7, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 7, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 7, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 7, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 7, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 7, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 7, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 7, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 7, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 7, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 7, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %5) #3, !dbg !86
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !72, metadata !DIExpression()), !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !86
  %22 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %5, i32 5, i32 7) #3, !dbg !86
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %5) #3, !dbg !87
  %23 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %4) #3, !dbg !88
  call void @llvm.dbg.value(metadata i32 6, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i32 6, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 6, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 6, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 6, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 6, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 6, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 6, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 6, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 6, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 6, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 6, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 6, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 6, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 6, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 6, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 6, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 6, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 6, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %5) #3, !dbg !86
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !72, metadata !DIExpression()), !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !86
  %24 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %5, i32 5, i32 6) #3, !dbg !86
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %5) #3, !dbg !87
  %25 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %4) #3, !dbg !88
  call void @llvm.dbg.value(metadata i32 5, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i32 5, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 5, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 5, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 5, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 5, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 5, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 5, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 5, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 5, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 5, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 5, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 5, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 5, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 5, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 5, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 5, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 5, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 5, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %5) #3, !dbg !86
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !72, metadata !DIExpression()), !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !86
  %26 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %5, i32 5, i32 5) #3, !dbg !86
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %5) #3, !dbg !87
  %27 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %4) #3, !dbg !88
  call void @llvm.dbg.value(metadata i32 4, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i32 4, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 4, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 4, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 4, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 4, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 4, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 4, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 4, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 4, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 4, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 4, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 4, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 4, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 4, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 4, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 4, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 4, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 4, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %5) #3, !dbg !86
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !72, metadata !DIExpression()), !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !86
  %28 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %5, i32 5, i32 4) #3, !dbg !86
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %5) #3, !dbg !87
  %29 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %4) #3, !dbg !88
  call void @llvm.dbg.value(metadata i32 3, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i32 3, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 3, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 3, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 3, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 3, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 3, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 3, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 3, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 3, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 3, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 3, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 3, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 3, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 3, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 3, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 3, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 3, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 3, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %5) #3, !dbg !86
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !72, metadata !DIExpression()), !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !86
  %30 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %5, i32 5, i32 3) #3, !dbg !86
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %5) #3, !dbg !87
  %31 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %4) #3, !dbg !88
  call void @llvm.dbg.value(metadata i32 2, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i32 2, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 2, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 2, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 2, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 2, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 2, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 2, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 2, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 2, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 2, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 2, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 2, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 2, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 2, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 2, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 2, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 2, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 2, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %5) #3, !dbg !86
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !72, metadata !DIExpression()), !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !86
  %32 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %5, i32 5, i32 2) #3, !dbg !86
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %5) #3, !dbg !87
  %33 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %4) #3, !dbg !88
  call void @llvm.dbg.value(metadata i32 1, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i32 1, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 1, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 1, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 1, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 1, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 1, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 1, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 1, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 1, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 1, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 1, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 1, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 1, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 1, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 1, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 1, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 1, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 1, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %5) #3, !dbg !86
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !72, metadata !DIExpression()), !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !86
  %34 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %5, i32 5, i32 1) #3, !dbg !86
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %5) #3, !dbg !87
  %35 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %4) #3, !dbg !88
  call void @llvm.dbg.value(metadata i32 0, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i32 0, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 0, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 0, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 0, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 0, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 0, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 0, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 0, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 0, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 0, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 0, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 0, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 0, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 0, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 0, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 0, metadata !69, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !85
  call void @llvm.dbg.value(metadata i32 0, metadata !69, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.value(metadata i32 0, metadata !67, metadata !DIExpression()), !dbg !84
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %5) #3, !dbg !86
  call void @llvm.dbg.declare(metadata [5 x i8]* %3, metadata !72, metadata !DIExpression()), !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 5, i32 1, i1 false), !dbg !86
  %36 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %5, i32 5, i32 0) #3, !dbg !86
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %5) #3, !dbg !87
  %37 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %4) #3, !dbg !88
  call void @llvm.dbg.value(metadata i32 -1, metadata !67, metadata !DIExpression()), !dbg !84
  %38 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %4) #3, !dbg !89
  %39 = bitcast i8* %38 to i32*, !dbg !89
  call void @llvm.dbg.value(metadata i32* %39, metadata !65, metadata !DIExpression()), !dbg !90
  %40 = icmp eq i8* %38, null, !dbg !91
  br i1 %40, label %44, label %41, !dbg !93

; <label>:41:                                     ; preds = %1
  %42 = load i32, i32* %39, align 4, !dbg !94, !tbaa !80
  %43 = add nsw i32 %42, 1, !dbg !94
  store i32 %43, i32* %39, align 4, !dbg !94, !tbaa !80
  br label %44, !dbg !96

; <label>:44:                                     ; preds = %1, %41
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #3, !dbg !97
  ret i32 3, !dbg !98
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
!llvm.module.flags = !{!45, !46, !47}
!llvm.ident = !{!48}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "counter", scope: !2, file: !3, line: 16, type: !35, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !13)
!3 = !DIFile(filename: "xdp_prog_kern.c", directory: "/home/anuraag/mtp/proc_more/reverse/ingress-egress")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 2845, size: 32, elements: !7)
!6 = !DIFile(filename: "../includes/headers/linux/bpf.h", directory: "/home/anuraag/mtp/proc_more/reverse/ingress-egress")
!7 = !{!8, !9, !10, !11, !12}
!8 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!9 = !DIEnumerator(name: "XDP_DROP", value: 1)
!10 = !DIEnumerator(name: "XDP_PASS", value: 2)
!11 = !DIEnumerator(name: "XDP_TX", value: 3)
!12 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!13 = !{!0, !14, !20, !29}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 51, type: !16, isLocal: false, isDefinition: true)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 32, elements: !18)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !{!19}
!19 = !DISubrange(count: 4)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !22, line: 38, type: !23, isLocal: true, isDefinition: true)
!22 = !DIFile(filename: "../includes/headers/bpf_helpers.h", directory: "/home/anuraag/mtp/proc_more/reverse/ingress-egress")
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DISubroutineType(types: !25)
!25 = !{!26, !27, !26, null}
!26 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !17)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !22, line: 20, type: !31, isLocal: true, isDefinition: true)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = !DISubroutineType(types: !33)
!33 = !{!34, !34, !34}
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!35 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !22, line: 210, size: 224, elements: !36)
!36 = !{!37, !39, !40, !41, !42, !43, !44}
!37 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !35, file: !22, line: 211, baseType: !38, size: 32)
!38 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !35, file: !22, line: 212, baseType: !38, size: 32, offset: 32)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !35, file: !22, line: 213, baseType: !38, size: 32, offset: 64)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !35, file: !22, line: 214, baseType: !38, size: 32, offset: 96)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !35, file: !22, line: 215, baseType: !38, size: 32, offset: 128)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "inner_map_idx", scope: !35, file: !22, line: 216, baseType: !38, size: 32, offset: 160)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "numa_node", scope: !35, file: !22, line: 217, baseType: !38, size: 32, offset: 192)
!45 = !{i32 2, !"Dwarf Version", i32 4}
!46 = !{i32 2, !"Debug Info Version", i32 3}
!47 = !{i32 1, !"wchar_size", i32 4}
!48 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!49 = distinct !DISubprogram(name: "xdp_pass_func", scope: !3, file: !3, line: 25, type: !50, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !62)
!50 = !DISubroutineType(types: !51)
!51 = !{!26, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 2856, size: 160, elements: !54)
!54 = !{!55, !58, !59, !60, !61}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !53, file: !6, line: 2857, baseType: !56, size: 32)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !57, line: 27, baseType: !38)
!57 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "/home/anuraag/mtp/proc_more/reverse/ingress-egress")
!58 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !53, file: !6, line: 2858, baseType: !56, size: 32, offset: 32)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !53, file: !6, line: 2859, baseType: !56, size: 32, offset: 64)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !53, file: !6, line: 2861, baseType: !56, size: 32, offset: 96)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !53, file: !6, line: 2862, baseType: !56, size: 32, offset: 128)
!62 = !{!63, !64, !65, !67, !69, !72}
!63 = !DILocalVariable(name: "ctx", arg: 1, scope: !49, file: !3, line: 25, type: !52)
!64 = !DILocalVariable(name: "key", scope: !49, file: !3, line: 27, type: !26)
!65 = !DILocalVariable(name: "val", scope: !49, file: !3, line: 28, type: !66)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!67 = !DILocalVariable(name: "temp", scope: !68, file: !3, line: 30, type: !26)
!68 = distinct !DILexicalBlock(scope: !49, file: !3, line: 30, column: 5)
!69 = !DILocalVariable(name: "waste", scope: !70, file: !3, line: 31, type: !26)
!70 = distinct !DILexicalBlock(scope: !71, file: !3, line: 30, column: 38)
!71 = distinct !DILexicalBlock(scope: !68, file: !3, line: 30, column: 5)
!72 = !DILocalVariable(name: "____fmt", scope: !73, file: !3, line: 36, type: !74)
!73 = distinct !DILexicalBlock(scope: !70, file: !3, line: 36, column: 3)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 40, elements: !75)
!75 = !{!76}
!76 = !DISubrange(count: 5)
!77 = !DILocation(line: 25, column: 35, scope: !49)
!78 = !DILocation(line: 27, column: 5, scope: !49)
!79 = !DILocation(line: 27, column: 9, scope: !49)
!80 = !{!81, !81, i64 0}
!81 = !{!"int", !82, i64 0}
!82 = !{!"omnipotent char", !83, i64 0}
!83 = !{!"Simple C/C++ TBAA"}
!84 = !DILocation(line: 30, column: 13, scope: !68)
!85 = !DILocation(line: 31, column: 7, scope: !70)
!86 = !DILocation(line: 36, column: 3, scope: !73)
!87 = !DILocation(line: 36, column: 3, scope: !70)
!88 = !DILocation(line: 37, column: 9, scope: !70)
!89 = !DILocation(line: 40, column: 11, scope: !49)
!90 = !DILocation(line: 28, column: 10, scope: !49)
!91 = !DILocation(line: 41, column: 8, scope: !92)
!92 = distinct !DILexicalBlock(scope: !49, file: !3, line: 41, column: 8)
!93 = !DILocation(line: 41, column: 8, scope: !49)
!94 = !DILocation(line: 42, column: 15, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !3, line: 41, column: 12)
!96 = !DILocation(line: 43, column: 5, scope: !95)
!97 = !DILocation(line: 49, column: 1, scope: !49)
!98 = !DILocation(line: 48, column: 2, scope: !49)
