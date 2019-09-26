; ModuleID = 'xdp_prog_kern.c'
source_filename = "xdp_prog_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.bpf_map_def = type { i32, i32, i32, i32, i32, i32, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }

@counter = global %struct.bpf_map_def { i32 2, i32 4, i32 4, i32 10, i32 0, i32 0, i32 0 }, section "maps", align 4, !dbg !0
@tx_port = global %struct.bpf_map_def { i32 14, i32 4, i32 4, i32 10, i32 0, i32 0, i32 0 }, section "maps", align 4, !dbg !14
@_license = global [4 x i8] c"GPL\00", section "license", align 1, !dbg !27
@llvm.used = appending global [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* bitcast (%struct.bpf_map_def* @tx_port to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass_func to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define i32 @xdp_pass_func(%struct.xdp_md* nocapture readnone) #0 section "xdp_pass" !dbg !43 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !58, metadata !DIExpression()), !dbg !62
  %3 = bitcast i32* %2 to i8*, !dbg !63
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #3, !dbg !63
  call void @llvm.dbg.value(metadata i32 0, metadata !59, metadata !DIExpression()), !dbg !64
  store i32 0, i32* %2, align 4, !dbg !64, !tbaa !65
  %4 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %3) #3, !dbg !69
  %5 = bitcast i8* %4 to i32*, !dbg !69
  call void @llvm.dbg.value(metadata i32* %5, metadata !60, metadata !DIExpression()), !dbg !70
  %6 = icmp eq i8* %4, null, !dbg !71
  br i1 %6, label %10, label %7, !dbg !73

; <label>:7:                                      ; preds = %1
  %8 = load i32, i32* %5, align 4, !dbg !74, !tbaa !65
  %9 = add nsw i32 %8, 1, !dbg !74
  store i32 %9, i32* %5, align 4, !dbg !74, !tbaa !65
  br label %10, !dbg !76

; <label>:10:                                     ; preds = %1, %7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #3, !dbg !77
  ret i32 3, !dbg !78
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind readnone speculatable }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!39, !40, !41}
!llvm.ident = !{!42}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "counter", scope: !2, file: !3, line: 16, type: !16, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !13)
!3 = !DIFile(filename: "xdp_prog_kern.c", directory: "/home/anuraag/IITB/Sem5/ovs-examples/xdp-examples/exp-ingress-egress")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 2845, size: 32, elements: !7)
!6 = !DIFile(filename: "../includes/headers/linux/bpf.h", directory: "/home/anuraag/IITB/Sem5/ovs-examples/xdp-examples/exp-ingress-egress")
!7 = !{!8, !9, !10, !11, !12}
!8 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!9 = !DIEnumerator(name: "XDP_DROP", value: 1)
!10 = !DIEnumerator(name: "XDP_PASS", value: 2)
!11 = !DIEnumerator(name: "XDP_TX", value: 3)
!12 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!13 = !{!0, !14, !27, !33}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "tx_port", scope: !2, file: !3, line: 24, type: !16, isLocal: false, isDefinition: true)
!16 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !17, line: 210, size: 224, elements: !18)
!17 = !DIFile(filename: "../includes/headers/bpf_helpers.h", directory: "/home/anuraag/IITB/Sem5/ovs-examples/xdp-examples/exp-ingress-egress")
!18 = !{!19, !21, !22, !23, !24, !25, !26}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !16, file: !17, line: 211, baseType: !20, size: 32)
!20 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !16, file: !17, line: 212, baseType: !20, size: 32, offset: 32)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !16, file: !17, line: 213, baseType: !20, size: 32, offset: 64)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !16, file: !17, line: 214, baseType: !20, size: 32, offset: 96)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !16, file: !17, line: 215, baseType: !20, size: 32, offset: 128)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "inner_map_idx", scope: !16, file: !17, line: 216, baseType: !20, size: 32, offset: 160)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "numa_node", scope: !16, file: !17, line: 217, baseType: !20, size: 32, offset: 192)
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 48, type: !29, isLocal: false, isDefinition: true)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 32, elements: !31)
!30 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!31 = !{!32}
!32 = !DISubrange(count: 4)
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !17, line: 20, type: !35, isLocal: true, isDefinition: true)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DISubroutineType(types: !37)
!37 = !{!38, !38, !38}
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!39 = !{i32 2, !"Dwarf Version", i32 4}
!40 = !{i32 2, !"Debug Info Version", i32 3}
!41 = !{i32 1, !"wchar_size", i32 4}
!42 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!43 = distinct !DISubprogram(name: "xdp_pass_func", scope: !3, file: !3, line: 32, type: !44, isLocal: false, isDefinition: true, scopeLine: 33, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !57)
!44 = !DISubroutineType(types: !45)
!45 = !{!46, !47}
!46 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 2856, size: 160, elements: !49)
!49 = !{!50, !53, !54, !55, !56}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !48, file: !6, line: 2857, baseType: !51, size: 32)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !52, line: 27, baseType: !20)
!52 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "/home/anuraag/IITB/Sem5/ovs-examples/xdp-examples/exp-ingress-egress")
!53 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !48, file: !6, line: 2858, baseType: !51, size: 32, offset: 32)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !48, file: !6, line: 2859, baseType: !51, size: 32, offset: 64)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !48, file: !6, line: 2861, baseType: !51, size: 32, offset: 96)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !48, file: !6, line: 2862, baseType: !51, size: 32, offset: 128)
!57 = !{!58, !59, !60}
!58 = !DILocalVariable(name: "ctx", arg: 1, scope: !43, file: !3, line: 32, type: !47)
!59 = !DILocalVariable(name: "key", scope: !43, file: !3, line: 34, type: !46)
!60 = !DILocalVariable(name: "val", scope: !43, file: !3, line: 35, type: !61)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!62 = !DILocation(line: 32, column: 35, scope: !43)
!63 = !DILocation(line: 34, column: 5, scope: !43)
!64 = !DILocation(line: 34, column: 9, scope: !43)
!65 = !{!66, !66, i64 0}
!66 = !{!"int", !67, i64 0}
!67 = !{!"omnipotent char", !68, i64 0}
!68 = !{!"Simple C/C++ TBAA"}
!69 = !DILocation(line: 37, column: 11, scope: !43)
!70 = !DILocation(line: 35, column: 10, scope: !43)
!71 = !DILocation(line: 38, column: 8, scope: !72)
!72 = distinct !DILexicalBlock(scope: !43, file: !3, line: 38, column: 8)
!73 = !DILocation(line: 38, column: 8, scope: !43)
!74 = !DILocation(line: 39, column: 15, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !3, line: 38, column: 12)
!76 = !DILocation(line: 40, column: 5, scope: !75)
!77 = !DILocation(line: 46, column: 1, scope: !43)
!78 = !DILocation(line: 45, column: 2, scope: !43)
