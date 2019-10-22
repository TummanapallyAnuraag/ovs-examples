; ModuleID = 'xdp_prog_kern.c'
source_filename = "xdp_prog_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.bpf_map_def = type { i32, i32, i32, i32, i32, i32, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

@counter = global %struct.bpf_map_def { i32 2, i32 4, i32 4, i32 10, i32 0, i32 0, i32 0 }, section "maps", align 4, !dbg !0
@tx_port = global %struct.bpf_map_def { i32 14, i32 4, i32 4, i32 10, i32 0, i32 0, i32 0 }, section "maps", align 4, !dbg !9
@_license = global [4 x i8] c"GPL\00", section "license", align 1, !dbg !22
@llvm.used = appending global [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* bitcast (%struct.bpf_map_def* @tx_port to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass_func to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define i32 @xdp_pass_func(%struct.xdp_md* nocapture readonly) #0 section "xdp_pass" !dbg !43 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !58, metadata !DIExpression()), !dbg !92
  %3 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !93
  %4 = load i32, i32* %3, align 4, !dbg !93, !tbaa !94
  %5 = zext i32 %4 to i64, !dbg !99
  %6 = inttoptr i64 %5 to i8*, !dbg !100
  call void @llvm.dbg.value(metadata i8* %6, metadata !59, metadata !DIExpression()), !dbg !101
  %7 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !102
  %8 = load i32, i32* %7, align 4, !dbg !102, !tbaa !103
  %9 = zext i32 %8 to i64, !dbg !104
  %10 = inttoptr i64 %9 to i8*, !dbg !105
  call void @llvm.dbg.value(metadata i8* %10, metadata !60, metadata !DIExpression()), !dbg !106
  %11 = inttoptr i64 %5 to %struct.ethhdr*, !dbg !107
  call void @llvm.dbg.value(metadata %struct.ethhdr* %11, metadata !61, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.value(metadata i64 14, metadata !77, metadata !DIExpression()), !dbg !109
  %12 = getelementptr i8, i8* %6, i64 14, !dbg !110
  %13 = icmp ugt i8* %12, %10, !dbg !112
  br i1 %13, label %36, label %14, !dbg !113

; <label>:14:                                     ; preds = %1
  %15 = bitcast i32* %2 to i8*, !dbg !114
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %15) #3, !dbg !114
  call void @llvm.dbg.value(metadata i32 0, metadata !80, metadata !DIExpression()), !dbg !115
  store i32 0, i32* %2, align 4, !dbg !115, !tbaa !116
  %16 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @counter to i8*), i8* nonnull %15) #3, !dbg !117
  %17 = bitcast i8* %16 to i32*, !dbg !117
  call void @llvm.dbg.value(metadata i32* %17, metadata !81, metadata !DIExpression()), !dbg !118
  %18 = icmp eq i8* %16, null, !dbg !119
  br i1 %18, label %22, label %19, !dbg !121

; <label>:19:                                     ; preds = %14
  %20 = load i32, i32* %17, align 4, !dbg !122, !tbaa !116
  %21 = add nsw i32 %20, 1, !dbg !122
  store i32 %21, i32* %17, align 4, !dbg !122, !tbaa !116
  br label %22, !dbg !124

; <label>:22:                                     ; preds = %14, %19
  call void @llvm.dbg.value(metadata i8 -32, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !125
  call void @llvm.dbg.value(metadata i8 12, metadata !88, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !126
  call void @llvm.dbg.value(metadata i8 -43, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 8, 8)), !dbg !125
  call void @llvm.dbg.value(metadata i8 84, metadata !88, metadata !DIExpression(DW_OP_LLVM_fragment, 8, 8)), !dbg !126
  call void @llvm.dbg.value(metadata i8 94, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 16, 8)), !dbg !125
  call void @llvm.dbg.value(metadata i8 -91, metadata !88, metadata !DIExpression(DW_OP_LLVM_fragment, 16, 8)), !dbg !126
  call void @llvm.dbg.value(metadata i8 70, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 24, 8)), !dbg !125
  call void @llvm.dbg.value(metadata i8 22, metadata !88, metadata !DIExpression(DW_OP_LLVM_fragment, 24, 8)), !dbg !126
  call void @llvm.dbg.value(metadata i8 88, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 8)), !dbg !125
  call void @llvm.dbg.value(metadata i8 -49, metadata !88, metadata !DIExpression(DW_OP_LLVM_fragment, 32, 8)), !dbg !126
  call void @llvm.dbg.value(metadata i8 -120, metadata !91, metadata !DIExpression(DW_OP_LLVM_fragment, 40, 8)), !dbg !125
  call void @llvm.dbg.value(metadata i8 39, metadata !88, metadata !DIExpression(DW_OP_LLVM_fragment, 40, 8)), !dbg !126
  %23 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 1, i64 0, !dbg !127
  store i8 -32, i8* %23, align 1, !dbg !127
  %24 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 1, i64 1, !dbg !127
  store i8 -43, i8* %24, align 1, !dbg !127
  %25 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 1, i64 2, !dbg !127
  store i8 94, i8* %25, align 1, !dbg !127
  %26 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 1, i64 3, !dbg !127
  store i8 70, i8* %26, align 1, !dbg !127
  %27 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 1, i64 4, !dbg !127
  store i8 88, i8* %27, align 1, !dbg !127
  %28 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 1, i64 5, !dbg !127
  store i8 -120, i8* %28, align 1, !dbg !127
  %29 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 0, i64 0, !dbg !128
  store i8 12, i8* %29, align 1, !dbg !128
  %30 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 0, i64 1, !dbg !128
  store i8 84, i8* %30, align 1, !dbg !128
  %31 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 0, i64 2, !dbg !128
  store i8 -91, i8* %31, align 1, !dbg !128
  %32 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 0, i64 3, !dbg !128
  store i8 22, i8* %32, align 1, !dbg !128
  %33 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 0, i64 4, !dbg !128
  store i8 -49, i8* %33, align 1, !dbg !128
  %34 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %11, i64 0, i32 0, i64 5, !dbg !128
  store i8 39, i8* %34, align 1, !dbg !128
  %35 = call i32 inttoptr (i64 51 to i32 (i8*, i32, i32)*)(i8* bitcast (%struct.bpf_map_def* @tx_port to i8*), i32 3, i32 0) #3, !dbg !129
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %15) #3, !dbg !130
  br label %36

; <label>:36:                                     ; preds = %1, %22
  %37 = phi i32 [ %35, %22 ], [ 0, %1 ]
  ret i32 %37, !dbg !130
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
!1 = distinct !DIGlobalVariable(name: "counter", scope: !2, file: !3, line: 16, type: !11, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8)
!3 = !DIFile(filename: "xdp_prog_kern.c", directory: "/home/anuraag/mtp/proc_more/forward/ingress-3-egress")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!8 = !{!0, !9, !22, !28, !33}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "tx_port", scope: !2, file: !3, line: 24, type: !11, isLocal: false, isDefinition: true)
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !12, line: 210, size: 224, elements: !13)
!12 = !DIFile(filename: "../includes/headers/bpf_helpers.h", directory: "/home/anuraag/mtp/proc_more/forward/ingress-3-egress")
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
!29 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !12, line: 20, type: !30, isLocal: true, isDefinition: true)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!31 = !DISubroutineType(types: !32)
!32 = !{!6, !6, !6}
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(name: "bpf_redirect_map", scope: !2, file: !12, line: 57, type: !35, isLocal: true, isDefinition: true)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DISubroutineType(types: !37)
!37 = !{!38, !6, !38, !38}
!38 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!39 = !{i32 2, !"Dwarf Version", i32 4}
!40 = !{i32 2, !"Debug Info Version", i32 3}
!41 = !{i32 1, !"wchar_size", i32 4}
!42 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!43 = distinct !DISubprogram(name: "xdp_pass_func", scope: !3, file: !3, line: 32, type: !44, isLocal: false, isDefinition: true, scopeLine: 33, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !57)
!44 = !DISubroutineType(types: !45)
!45 = !{!38, !46}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !48, line: 2856, size: 160, elements: !49)
!48 = !DIFile(filename: "../includes/headers/linux/bpf.h", directory: "/home/anuraag/mtp/proc_more/forward/ingress-3-egress")
!49 = !{!50, !53, !54, !55, !56}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !47, file: !48, line: 2857, baseType: !51, size: 32)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !52, line: 27, baseType: !15)
!52 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "/home/anuraag/mtp/proc_more/forward/ingress-3-egress")
!53 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !47, file: !48, line: 2858, baseType: !51, size: 32, offset: 32)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !47, file: !48, line: 2859, baseType: !51, size: 32, offset: 64)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !47, file: !48, line: 2861, baseType: !51, size: 32, offset: 96)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !47, file: !48, line: 2862, baseType: !51, size: 32, offset: 128)
!57 = !{!58, !59, !60, !61, !77, !80, !81, !83, !85, !88, !91}
!58 = !DILocalVariable(name: "ctx", arg: 1, scope: !43, file: !3, line: 32, type: !46)
!59 = !DILocalVariable(name: "data", scope: !43, file: !3, line: 34, type: !6)
!60 = !DILocalVariable(name: "data_end", scope: !43, file: !3, line: 35, type: !6)
!61 = !DILocalVariable(name: "eth", scope: !43, file: !3, line: 36, type: !62)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !64, line: 159, size: 112, elements: !65)
!64 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "/home/anuraag/mtp/proc_more/forward/ingress-3-egress")
!65 = !{!66, !71, !72}
!66 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !63, file: !64, line: 160, baseType: !67, size: 48)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !68, size: 48, elements: !69)
!68 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!69 = !{!70}
!70 = !DISubrange(count: 6)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !63, file: !64, line: 161, baseType: !67, size: 48, offset: 48)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !63, file: !64, line: 162, baseType: !73, size: 16, offset: 96)
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !74, line: 25, baseType: !75)
!74 = !DIFile(filename: "/usr/include/linux/types.h", directory: "/home/anuraag/mtp/proc_more/forward/ingress-3-egress")
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !52, line: 24, baseType: !76)
!76 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!77 = !DILocalVariable(name: "offset", scope: !43, file: !3, line: 37, type: !78)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !52, line: 31, baseType: !79)
!79 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!80 = !DILocalVariable(name: "key", scope: !43, file: !3, line: 42, type: !38)
!81 = !DILocalVariable(name: "val", scope: !43, file: !3, line: 43, type: !82)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!83 = !DILocalVariable(name: "temp", scope: !84, file: !3, line: 45, type: !38)
!84 = distinct !DILexicalBlock(scope: !43, file: !3, line: 45, column: 5)
!85 = !DILocalVariable(name: "waste", scope: !86, file: !3, line: 46, type: !38)
!86 = distinct !DILexicalBlock(scope: !87, file: !3, line: 45, column: 38)
!87 = distinct !DILexicalBlock(scope: !84, file: !3, line: 45, column: 5)
!88 = !DILocalVariable(name: "dst", scope: !43, file: !3, line: 64, type: !89)
!89 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 48, elements: !69)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !52, line: 21, baseType: !68)
!91 = !DILocalVariable(name: "src", scope: !43, file: !3, line: 64, type: !89)
!92 = !DILocation(line: 32, column: 35, scope: !43)
!93 = !DILocation(line: 34, column: 34, scope: !43)
!94 = !{!95, !96, i64 0}
!95 = !{!"xdp_md", !96, i64 0, !96, i64 4, !96, i64 8, !96, i64 12, !96, i64 16}
!96 = !{!"int", !97, i64 0}
!97 = !{!"omnipotent char", !98, i64 0}
!98 = !{!"Simple C/C++ TBAA"}
!99 = !DILocation(line: 34, column: 23, scope: !43)
!100 = !DILocation(line: 34, column: 15, scope: !43)
!101 = !DILocation(line: 34, column: 8, scope: !43)
!102 = !DILocation(line: 35, column: 38, scope: !43)
!103 = !{!95, !96, i64 4}
!104 = !DILocation(line: 35, column: 27, scope: !43)
!105 = !DILocation(line: 35, column: 19, scope: !43)
!106 = !DILocation(line: 35, column: 8, scope: !43)
!107 = !DILocation(line: 36, column: 23, scope: !43)
!108 = !DILocation(line: 36, column: 17, scope: !43)
!109 = !DILocation(line: 37, column: 8, scope: !43)
!110 = !DILocation(line: 39, column: 18, scope: !111)
!111 = distinct !DILexicalBlock(scope: !43, file: !3, line: 39, column: 6)
!112 = !DILocation(line: 39, column: 27, scope: !111)
!113 = !DILocation(line: 39, column: 6, scope: !43)
!114 = !DILocation(line: 42, column: 5, scope: !43)
!115 = !DILocation(line: 42, column: 9, scope: !43)
!116 = !{!96, !96, i64 0}
!117 = !DILocation(line: 54, column: 11, scope: !43)
!118 = !DILocation(line: 43, column: 10, scope: !43)
!119 = !DILocation(line: 55, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !43, file: !3, line: 55, column: 8)
!121 = !DILocation(line: 55, column: 8, scope: !43)
!122 = !DILocation(line: 56, column: 15, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !3, line: 55, column: 12)
!124 = !DILocation(line: 57, column: 5, scope: !123)
!125 = !DILocation(line: 64, column: 15, scope: !43)
!126 = !DILocation(line: 64, column: 7, scope: !43)
!127 = !DILocation(line: 72, column: 2, scope: !43)
!128 = !DILocation(line: 73, column: 2, scope: !43)
!129 = !DILocation(line: 75, column: 9, scope: !43)
!130 = !DILocation(line: 76, column: 1, scope: !43)
