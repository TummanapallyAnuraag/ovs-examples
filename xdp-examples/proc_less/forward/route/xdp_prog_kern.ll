; ModuleID = 'xdp_prog_kern.c'
source_filename = "xdp_prog_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.bpf_map_def = type { i32, i32, i32, i32, i32, i32, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, i32, i32 }

@counter = global %struct.bpf_map_def { i32 2, i32 4, i32 4, i32 10, i32 0, i32 0, i32 0 }, section "maps", align 4, !dbg !0
@tx_port = global %struct.bpf_map_def { i32 14, i32 4, i32 4, i32 10, i32 0, i32 0, i32 0 }, section "maps", align 4, !dbg !43
@xdp_pass_func.____fmt = private unnamed_addr constant [6 x i8] c"IPv4\0A\00", align 1
@_license = global [4 x i8] c"GPL\00", section "license", align 1, !dbg !55
@llvm.used = appending global [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* bitcast (%struct.bpf_map_def* @tx_port to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass_func to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define i32 @xdp_pass_func(%struct.xdp_md* nocapture readonly) #0 section "xdp_pass" !dbg !83 {
  %2 = alloca [6 x i8], align 1
  %3 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !95, metadata !DIExpression()), !dbg !125
  %4 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !126
  %5 = load i32, i32* %4, align 4, !dbg !126, !tbaa !127
  %6 = zext i32 %5 to i64, !dbg !132
  %7 = inttoptr i64 %6 to i8*, !dbg !133
  call void @llvm.dbg.value(metadata i8* %7, metadata !96, metadata !DIExpression()), !dbg !134
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !135
  %9 = load i32, i32* %8, align 4, !dbg !135, !tbaa !136
  %10 = zext i32 %9 to i64, !dbg !137
  %11 = inttoptr i64 %10 to i8*, !dbg !138
  call void @llvm.dbg.value(metadata i8* %11, metadata !97, metadata !DIExpression()), !dbg !139
  %12 = inttoptr i64 %6 to %struct.ethhdr*, !dbg !140
  call void @llvm.dbg.value(metadata %struct.ethhdr* %12, metadata !98, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata %struct.iphdr* null, metadata !109, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata i64 14, metadata !111, metadata !DIExpression()), !dbg !143
  %13 = getelementptr i8, i8* %7, i64 14, !dbg !144
  %14 = icmp ugt i8* %13, %11, !dbg !146
  br i1 %14, label %52, label %15, !dbg !147

; <label>:15:                                     ; preds = %1
  %16 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 2, !dbg !148
  %17 = load i16, i16* %16, align 1, !dbg !148, !tbaa !149
  call void @llvm.dbg.value(metadata i16 %17, metadata !110, metadata !DIExpression()), !dbg !152
  %18 = icmp eq i16 %17, 8, !dbg !153
  br i1 %18, label %19, label %30, !dbg !154

; <label>:19:                                     ; preds = %15
  %20 = getelementptr inbounds [6 x i8], [6 x i8]* %2, i64 0, i64 0, !dbg !155
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %20) #3, !dbg !155
  call void @llvm.dbg.declare(metadata [6 x i8]* %2, metadata !114, metadata !DIExpression()), !dbg !155
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %20, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @xdp_pass_func.____fmt, i64 0, i64 0), i64 6, i32 1, i1 false), !dbg !155
  %21 = call i32 (i8*, i32, ...) inttoptr (i64 6 to i32 (i8*, i32, ...)*)(i8* nonnull %20, i32 6) #3, !dbg !155
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %20) #3, !dbg !156
  call void @llvm.dbg.value(metadata i8* %13, metadata !109, metadata !DIExpression()), !dbg !142
  %22 = getelementptr i8, i8* %7, i64 34, !dbg !157
  %23 = icmp ugt i8* %22, %11, !dbg !159
  br i1 %23, label %52, label %24, !dbg !160

; <label>:24:                                     ; preds = %19
  %25 = getelementptr inbounds i8, i8* %7, i64 22, !dbg !161
  %26 = load i8, i8* %25, align 4, !dbg !161, !tbaa !163
  %27 = icmp eq i8 %26, 0, !dbg !165
  br i1 %27, label %52, label %28, !dbg !166

; <label>:28:                                     ; preds = %24
  %29 = add i8 %26, -1, !dbg !167
  store i8 %29, i8* %25, align 4, !dbg !167, !tbaa !163
  br label %30, !dbg !168

; <label>:30:                                     ; preds = %28, %15
  %31 = bitcast i32* %3 to i8*, !dbg !169
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %31) #3, !dbg !169
  call void @llvm.dbg.value(metadata i32 0, metadata !119, metadata !DIExpression()), !dbg !170
  store i32 0, i32* %3, align 4, !dbg !170, !tbaa !171
  %32 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %31) #3, !dbg !172
  %33 = bitcast i8* %32 to i32*, !dbg !172
  call void @llvm.dbg.value(metadata i32* %33, metadata !120, metadata !DIExpression()), !dbg !173
  %34 = icmp eq i8* %32, null, !dbg !174
  br i1 %34, label %38, label %35, !dbg !176

; <label>:35:                                     ; preds = %30
  %36 = load i32, i32* %33, align 4, !dbg !177, !tbaa !171
  %37 = add nsw i32 %36, 1, !dbg !177
  store i32 %37, i32* %33, align 4, !dbg !177, !tbaa !171
  br label %38, !dbg !179

; <label>:38:                                     ; preds = %30, %35
  call void @llvm.dbg.value(metadata i8 -32, metadata !124, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !180
  call void @llvm.dbg.value(metadata i8 12, metadata !122, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !181
  call void @llvm.dbg.value(metadata i8 -43, metadata !124, metadata !DIExpression(DW_OP_LLVM_fragment, 8, 8)), !dbg !180
  call void @llvm.dbg.value(metadata i8 84, metadata !122, metadata !DIExpression(DW_OP_LLVM_fragment, 8, 8)), !dbg !181
  call void @llvm.dbg.value(metadata i8 94, metadata !124, metadata !DIExpression(DW_OP_LLVM_fragment, 16, 8)), !dbg !180
  call void @llvm.dbg.value(metadata i8 -91, metadata !122, metadata !DIExpression(DW_OP_LLVM_fragment, 16, 8)), !dbg !181
  call void @llvm.dbg.value(metadata i8 70, metadata !124, metadata !DIExpression(DW_OP_LLVM_fragment, 24, 8)), !dbg !180
  call void @llvm.dbg.value(metadata i8 22, metadata !122, metadata !DIExpression(DW_OP_LLVM_fragment, 24, 8)), !dbg !181
  call void @llvm.dbg.value(metadata i8 88, metadata !124, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 8)), !dbg !180
  call void @llvm.dbg.value(metadata i8 -49, metadata !122, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 8)), !dbg !181
  call void @llvm.dbg.value(metadata i8 -120, metadata !124, metadata !DIExpression(DW_OP_LLVM_fragment, 40, 8)), !dbg !180
  call void @llvm.dbg.value(metadata i8 39, metadata !122, metadata !DIExpression(DW_OP_LLVM_fragment, 40, 8)), !dbg !181
  %39 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 1, i64 0, !dbg !182
  store i8 -32, i8* %39, align 1, !dbg !182
  %40 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 1, i64 1, !dbg !182
  store i8 -43, i8* %40, align 1, !dbg !182
  %41 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 1, i64 2, !dbg !182
  store i8 94, i8* %41, align 1, !dbg !182
  %42 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 1, i64 3, !dbg !182
  store i8 70, i8* %42, align 1, !dbg !182
  %43 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 1, i64 4, !dbg !182
  store i8 88, i8* %43, align 1, !dbg !182
  %44 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 1, i64 5, !dbg !182
  store i8 -120, i8* %44, align 1, !dbg !182
  %45 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 0, i64 0, !dbg !183
  store i8 12, i8* %45, align 1, !dbg !183
  %46 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 0, i64 1, !dbg !183
  store i8 84, i8* %46, align 1, !dbg !183
  %47 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 0, i64 2, !dbg !183
  store i8 -91, i8* %47, align 1, !dbg !183
  %48 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 0, i64 3, !dbg !183
  store i8 22, i8* %48, align 1, !dbg !183
  %49 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 0, i64 4, !dbg !183
  store i8 -49, i8* %49, align 1, !dbg !183
  %50 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 0, i64 5, !dbg !183
  store i8 39, i8* %50, align 1, !dbg !183
  %51 = call i32 inttoptr (i64 51 to i32 (i8*, i32, i32)*)(i8* bitcast (%struct.bpf_map_def* @tx_port to i8*), i32 3, i32 0) #3, !dbg !184
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %31) #3, !dbg !185
  br label %52

; <label>:52:                                     ; preds = %24, %19, %1, %38
  %53 = phi i32 [ %51, %38 ], [ 0, %1 ], [ 0, %19 ], [ 1, %24 ]
  ret i32 %53, !dbg !185
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
!llvm.module.flags = !{!79, !80, !81}
!llvm.ident = !{!82}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "counter", scope: !2, file: !3, line: 17, type: !45, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !13, globals: !42)
!3 = !DIFile(filename: "xdp_prog_kern.c", directory: "/home/anuraag/IITB/Sem5/ovs-examples/xdp-examples/proc_less/forward/route")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 2845, size: 32, elements: !7)
!6 = !DIFile(filename: "../includes/headers/linux/bpf.h", directory: "/home/anuraag/IITB/Sem5/ovs-examples/xdp-examples/proc_less/forward/route")
!7 = !{!8, !9, !10, !11, !12}
!8 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!9 = !DIEnumerator(name: "XDP_DROP", value: 1)
!10 = !DIEnumerator(name: "XDP_PASS", value: 2)
!11 = !DIEnumerator(name: "XDP_TX", value: 3)
!12 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!13 = !{!14, !15, !16, !19}
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!15 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !17, line: 24, baseType: !18)
!17 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "/home/anuraag/IITB/Sem5/ovs-examples/xdp-examples/proc_less/forward/route")
!18 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !21, line: 86, size: 160, elements: !22)
!21 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "/home/anuraag/IITB/Sem5/ovs-examples/xdp-examples/proc_less/forward/route")
!22 = !{!23, !26, !27, !28, !31, !32, !33, !34, !35, !37, !41}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !20, file: !21, line: 88, baseType: !24, size: 4, flags: DIFlagBitField, extraData: i64 0)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !17, line: 21, baseType: !25)
!25 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !20, file: !21, line: 89, baseType: !24, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !20, file: !21, line: 96, baseType: !24, size: 8, offset: 8)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !20, file: !21, line: 97, baseType: !29, size: 16, offset: 16)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !30, line: 25, baseType: !16)
!30 = !DIFile(filename: "/usr/include/linux/types.h", directory: "/home/anuraag/IITB/Sem5/ovs-examples/xdp-examples/proc_less/forward/route")
!31 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !20, file: !21, line: 98, baseType: !29, size: 16, offset: 32)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !20, file: !21, line: 99, baseType: !29, size: 16, offset: 48)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !20, file: !21, line: 100, baseType: !24, size: 8, offset: 64)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !20, file: !21, line: 101, baseType: !24, size: 8, offset: 72)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !20, file: !21, line: 102, baseType: !36, size: 16, offset: 80)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !30, line: 31, baseType: !16)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !20, file: !21, line: 103, baseType: !38, size: 32, offset: 96)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !30, line: 27, baseType: !39)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !17, line: 27, baseType: !40)
!40 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !20, file: !21, line: 104, baseType: !38, size: 32, offset: 128)
!42 = !{!0, !43, !55, !61, !69, !74}
!43 = !DIGlobalVariableExpression(var: !44, expr: !DIExpression())
!44 = distinct !DIGlobalVariable(name: "tx_port", scope: !2, file: !3, line: 25, type: !45, isLocal: false, isDefinition: true)
!45 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !46, line: 210, size: 224, elements: !47)
!46 = !DIFile(filename: "../includes/headers/bpf_helpers.h", directory: "/home/anuraag/IITB/Sem5/ovs-examples/xdp-examples/proc_less/forward/route")
!47 = !{!48, !49, !50, !51, !52, !53, !54}
!48 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !45, file: !46, line: 211, baseType: !40, size: 32)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !45, file: !46, line: 212, baseType: !40, size: 32, offset: 32)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !45, file: !46, line: 213, baseType: !40, size: 32, offset: 64)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !45, file: !46, line: 214, baseType: !40, size: 32, offset: 96)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !45, file: !46, line: 215, baseType: !40, size: 32, offset: 128)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "inner_map_idx", scope: !45, file: !46, line: 216, baseType: !40, size: 32, offset: 160)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "numa_node", scope: !45, file: !46, line: 217, baseType: !40, size: 32, offset: 192)
!55 = !DIGlobalVariableExpression(var: !56, expr: !DIExpression())
!56 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 84, type: !57, isLocal: false, isDefinition: true)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 32, elements: !59)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !{!60}
!60 = !DISubrange(count: 4)
!61 = !DIGlobalVariableExpression(var: !62, expr: !DIExpression())
!62 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !46, line: 38, type: !63, isLocal: true, isDefinition: true)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !67, !66, null}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !58)
!69 = !DIGlobalVariableExpression(var: !70, expr: !DIExpression())
!70 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !46, line: 20, type: !71, isLocal: true, isDefinition: true)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DISubroutineType(types: !73)
!73 = !{!14, !14, !14}
!74 = !DIGlobalVariableExpression(var: !75, expr: !DIExpression())
!75 = distinct !DIGlobalVariable(name: "bpf_redirect_map", scope: !2, file: !46, line: 57, type: !76, isLocal: true, isDefinition: true)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DISubroutineType(types: !78)
!78 = !{!66, !14, !66, !66}
!79 = !{i32 2, !"Dwarf Version", i32 4}
!80 = !{i32 2, !"Debug Info Version", i32 3}
!81 = !{i32 1, !"wchar_size", i32 4}
!82 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!83 = distinct !DISubprogram(name: "xdp_pass_func", scope: !3, file: !3, line: 33, type: !84, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !94)
!84 = !DISubroutineType(types: !85)
!85 = !{!66, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 2856, size: 160, elements: !88)
!88 = !{!89, !90, !91, !92, !93}
!89 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !87, file: !6, line: 2857, baseType: !39, size: 32)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !87, file: !6, line: 2858, baseType: !39, size: 32, offset: 32)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !87, file: !6, line: 2859, baseType: !39, size: 32, offset: 64)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !87, file: !6, line: 2861, baseType: !39, size: 32, offset: 96)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !87, file: !6, line: 2862, baseType: !39, size: 32, offset: 128)
!94 = !{!95, !96, !97, !98, !109, !110, !111, !114, !119, !120, !122, !124}
!95 = !DILocalVariable(name: "ctx", arg: 1, scope: !83, file: !3, line: 33, type: !86)
!96 = !DILocalVariable(name: "data", scope: !83, file: !3, line: 35, type: !14)
!97 = !DILocalVariable(name: "data_end", scope: !83, file: !3, line: 36, type: !14)
!98 = !DILocalVariable(name: "eth", scope: !83, file: !3, line: 37, type: !99)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !101, line: 163, size: 112, elements: !102)
!101 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "/home/anuraag/IITB/Sem5/ovs-examples/xdp-examples/proc_less/forward/route")
!102 = !{!103, !107, !108}
!103 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !100, file: !101, line: 164, baseType: !104, size: 48)
!104 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 48, elements: !105)
!105 = !{!106}
!106 = !DISubrange(count: 6)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !100, file: !101, line: 165, baseType: !104, size: 48, offset: 48)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !100, file: !101, line: 166, baseType: !29, size: 16, offset: 96)
!109 = !DILocalVariable(name: "iph", scope: !83, file: !3, line: 38, type: !19)
!110 = !DILocalVariable(name: "eth_type", scope: !83, file: !3, line: 39, type: !16)
!111 = !DILocalVariable(name: "offset", scope: !83, file: !3, line: 40, type: !112)
!112 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !17, line: 31, baseType: !113)
!113 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!114 = !DILocalVariable(name: "____fmt", scope: !115, file: !3, line: 48, type: !118)
!115 = distinct !DILexicalBlock(scope: !116, file: !3, line: 48, column: 3)
!116 = distinct !DILexicalBlock(scope: !117, file: !3, line: 47, column: 37)
!117 = distinct !DILexicalBlock(scope: !83, file: !3, line: 47, column: 6)
!118 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 48, elements: !105)
!119 = !DILocalVariable(name: "key", scope: !83, file: !3, line: 57, type: !66)
!120 = !DILocalVariable(name: "val", scope: !83, file: !3, line: 58, type: !121)
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!122 = !DILocalVariable(name: "dst", scope: !83, file: !3, line: 70, type: !123)
!123 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 48, elements: !105)
!124 = !DILocalVariable(name: "src", scope: !83, file: !3, line: 70, type: !123)
!125 = !DILocation(line: 33, column: 35, scope: !83)
!126 = !DILocation(line: 35, column: 34, scope: !83)
!127 = !{!128, !129, i64 0}
!128 = !{!"xdp_md", !129, i64 0, !129, i64 4, !129, i64 8, !129, i64 12, !129, i64 16}
!129 = !{!"int", !130, i64 0}
!130 = !{!"omnipotent char", !131, i64 0}
!131 = !{!"Simple C/C++ TBAA"}
!132 = !DILocation(line: 35, column: 23, scope: !83)
!133 = !DILocation(line: 35, column: 15, scope: !83)
!134 = !DILocation(line: 35, column: 8, scope: !83)
!135 = !DILocation(line: 36, column: 38, scope: !83)
!136 = !{!128, !129, i64 4}
!137 = !DILocation(line: 36, column: 27, scope: !83)
!138 = !DILocation(line: 36, column: 19, scope: !83)
!139 = !DILocation(line: 36, column: 8, scope: !83)
!140 = !DILocation(line: 37, column: 23, scope: !83)
!141 = !DILocation(line: 37, column: 17, scope: !83)
!142 = !DILocation(line: 38, column: 16, scope: !83)
!143 = !DILocation(line: 40, column: 8, scope: !83)
!144 = !DILocation(line: 42, column: 18, scope: !145)
!145 = distinct !DILexicalBlock(scope: !83, file: !3, line: 42, column: 6)
!146 = !DILocation(line: 42, column: 27, scope: !145)
!147 = !DILocation(line: 42, column: 6, scope: !83)
!148 = !DILocation(line: 45, column: 18, scope: !83)
!149 = !{!150, !151, i64 12}
!150 = !{!"ethhdr", !130, i64 0, !130, i64 6, !151, i64 12}
!151 = !{!"short", !130, i64 0}
!152 = !DILocation(line: 39, column: 8, scope: !83)
!153 = !DILocation(line: 47, column: 15, scope: !117)
!154 = !DILocation(line: 47, column: 6, scope: !83)
!155 = !DILocation(line: 48, column: 3, scope: !115)
!156 = !DILocation(line: 48, column: 3, scope: !116)
!157 = !DILocation(line: 50, column: 19, scope: !158)
!158 = distinct !DILexicalBlock(scope: !116, file: !3, line: 50, column: 7)
!159 = !DILocation(line: 50, column: 34, scope: !158)
!160 = !DILocation(line: 50, column: 7, scope: !116)
!161 = !DILocation(line: 52, column: 11, scope: !162)
!162 = distinct !DILexicalBlock(scope: !116, file: !3, line: 52, column: 6)
!163 = !{!164, !130, i64 8}
!164 = !{!"iphdr", !130, i64 0, !130, i64 0, !130, i64 1, !151, i64 2, !151, i64 4, !151, i64 6, !130, i64 8, !130, i64 9, !151, i64 10, !129, i64 12, !129, i64 16}
!165 = !DILocation(line: 52, column: 15, scope: !162)
!166 = !DILocation(line: 52, column: 6, scope: !116)
!167 = !DILocation(line: 54, column: 11, scope: !116)
!168 = !DILocation(line: 55, column: 5, scope: !116)
!169 = !DILocation(line: 57, column: 5, scope: !83)
!170 = !DILocation(line: 57, column: 9, scope: !83)
!171 = !{!129, !129, i64 0}
!172 = !DILocation(line: 60, column: 11, scope: !83)
!173 = !DILocation(line: 58, column: 10, scope: !83)
!174 = !DILocation(line: 61, column: 8, scope: !175)
!175 = distinct !DILexicalBlock(scope: !83, file: !3, line: 61, column: 8)
!176 = !DILocation(line: 61, column: 8, scope: !83)
!177 = !DILocation(line: 62, column: 15, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !3, line: 61, column: 12)
!179 = !DILocation(line: 63, column: 5, scope: !178)
!180 = !DILocation(line: 70, column: 15, scope: !83)
!181 = !DILocation(line: 70, column: 7, scope: !83)
!182 = !DILocation(line: 78, column: 2, scope: !83)
!183 = !DILocation(line: 79, column: 2, scope: !83)
!184 = !DILocation(line: 81, column: 9, scope: !83)
!185 = !DILocation(line: 82, column: 1, scope: !83)
