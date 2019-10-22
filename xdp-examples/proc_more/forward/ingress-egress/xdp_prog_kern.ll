; ModuleID = 'xdp_prog_kern.c'
source_filename = "xdp_prog_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.bpf_map_def = type { i32, i32, i32, i32, i32, i32, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }

@counter = global %struct.bpf_map_def { i32 2, i32 4, i32 4, i32 10, i32 0, i32 0, i32 0 }, section "maps", align 4, !dbg !0
@_license = global [4 x i8] c"GPL\00", section "license", align 1, !dbg !14
@llvm.used = appending global [3 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass_func to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define i32 @xdp_pass_func(%struct.xdp_md* nocapture readnone) #0 section "xdp_pass" !dbg !41 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !56, metadata !DIExpression()), !dbg !65
  %3 = bitcast i32* %2 to i8*, !dbg !66
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #3, !dbg !66
  call void @llvm.dbg.value(metadata i32 0, metadata !57, metadata !DIExpression()), !dbg !67
  store i32 0, i32* %2, align 4, !dbg !67, !tbaa !68
  %4 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %3) #3, !dbg !72
  %5 = bitcast i8* %4 to i32*, !dbg !72
  call void @llvm.dbg.value(metadata i32* %5, metadata !58, metadata !DIExpression()), !dbg !73
  %6 = icmp eq i8* %4, null, !dbg !74
  br i1 %6, label %10, label %7, !dbg !76

; <label>:7:                                      ; preds = %1
  %8 = load i32, i32* %5, align 4, !dbg !77, !tbaa !68
  %9 = add nsw i32 %8, 1, !dbg !77
  store i32 %9, i32* %5, align 4, !dbg !77, !tbaa !68
  br label %10, !dbg !79

; <label>:10:                                     ; preds = %1, %7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #3, !dbg !80
  ret i32 3, !dbg !81
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
!llvm.module.flags = !{!37, !38, !39}
!llvm.ident = !{!40}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "counter", scope: !2, file: !3, line: 16, type: !27, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !13)
!3 = !DIFile(filename: "xdp_prog_kern.c", directory: "/home/anuraag/mtp/proc_more/forward/ingress-egress")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 2845, size: 32, elements: !7)
!6 = !DIFile(filename: "../includes/headers/linux/bpf.h", directory: "/home/anuraag/mtp/proc_more/forward/ingress-egress")
!7 = !{!8, !9, !10, !11, !12}
!8 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!9 = !DIEnumerator(name: "XDP_DROP", value: 1)
!10 = !DIEnumerator(name: "XDP_PASS", value: 2)
!11 = !DIEnumerator(name: "XDP_TX", value: 3)
!12 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!13 = !{!0, !14, !20}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 50, type: !16, isLocal: false, isDefinition: true)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 32, elements: !18)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !{!19}
!19 = !DISubrange(count: 4)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !22, line: 20, type: !23, isLocal: true, isDefinition: true)
!22 = !DIFile(filename: "../includes/headers/bpf_helpers.h", directory: "/home/anuraag/mtp/proc_more/forward/ingress-egress")
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DISubroutineType(types: !25)
!25 = !{!26, !26, !26}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !22, line: 210, size: 224, elements: !28)
!28 = !{!29, !31, !32, !33, !34, !35, !36}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !27, file: !22, line: 211, baseType: !30, size: 32)
!30 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !27, file: !22, line: 212, baseType: !30, size: 32, offset: 32)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !27, file: !22, line: 213, baseType: !30, size: 32, offset: 64)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !27, file: !22, line: 214, baseType: !30, size: 32, offset: 96)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !27, file: !22, line: 215, baseType: !30, size: 32, offset: 128)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "inner_map_idx", scope: !27, file: !22, line: 216, baseType: !30, size: 32, offset: 160)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "numa_node", scope: !27, file: !22, line: 217, baseType: !30, size: 32, offset: 192)
!37 = !{i32 2, !"Dwarf Version", i32 4}
!38 = !{i32 2, !"Debug Info Version", i32 3}
!39 = !{i32 1, !"wchar_size", i32 4}
!40 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!41 = distinct !DISubprogram(name: "xdp_pass_func", scope: !3, file: !3, line: 25, type: !42, isLocal: false, isDefinition: true, scopeLine: 26, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !55)
!42 = !DISubroutineType(types: !43)
!43 = !{!44, !45}
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 2856, size: 160, elements: !47)
!47 = !{!48, !51, !52, !53, !54}
!48 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !46, file: !6, line: 2857, baseType: !49, size: 32)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !50, line: 27, baseType: !30)
!50 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "/home/anuraag/mtp/proc_more/forward/ingress-egress")
!51 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !46, file: !6, line: 2858, baseType: !49, size: 32, offset: 32)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !46, file: !6, line: 2859, baseType: !49, size: 32, offset: 64)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !46, file: !6, line: 2861, baseType: !49, size: 32, offset: 96)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !46, file: !6, line: 2862, baseType: !49, size: 32, offset: 128)
!55 = !{!56, !57, !58, !60, !62}
!56 = !DILocalVariable(name: "ctx", arg: 1, scope: !41, file: !3, line: 25, type: !45)
!57 = !DILocalVariable(name: "key", scope: !41, file: !3, line: 27, type: !44)
!58 = !DILocalVariable(name: "val", scope: !41, file: !3, line: 28, type: !59)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!60 = !DILocalVariable(name: "temp", scope: !61, file: !3, line: 30, type: !44)
!61 = distinct !DILexicalBlock(scope: !41, file: !3, line: 30, column: 5)
!62 = !DILocalVariable(name: "waste", scope: !63, file: !3, line: 31, type: !44)
!63 = distinct !DILexicalBlock(scope: !64, file: !3, line: 30, column: 38)
!64 = distinct !DILexicalBlock(scope: !61, file: !3, line: 30, column: 5)
!65 = !DILocation(line: 25, column: 35, scope: !41)
!66 = !DILocation(line: 27, column: 5, scope: !41)
!67 = !DILocation(line: 27, column: 9, scope: !41)
!68 = !{!69, !69, i64 0}
!69 = !{!"int", !70, i64 0}
!70 = !{!"omnipotent char", !71, i64 0}
!71 = !{!"Simple C/C++ TBAA"}
!72 = !DILocation(line: 39, column: 11, scope: !41)
!73 = !DILocation(line: 28, column: 10, scope: !41)
!74 = !DILocation(line: 40, column: 8, scope: !75)
!75 = distinct !DILexicalBlock(scope: !41, file: !3, line: 40, column: 8)
!76 = !DILocation(line: 40, column: 8, scope: !41)
!77 = !DILocation(line: 41, column: 15, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !3, line: 40, column: 12)
!79 = !DILocation(line: 42, column: 5, scope: !78)
!80 = !DILocation(line: 48, column: 1, scope: !41)
!81 = !DILocation(line: 47, column: 5, scope: !41)
