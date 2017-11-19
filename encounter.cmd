#######################################################
#                                                     
#  Encounter Command Logging File                     
#  Created on Sun Nov 19 14:12:38 2017                
#                                                     
#######################################################

#@(#)CDS: Encounter v14.23-s044_1 (64bit) 03/20/2015 11:30 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute v14.23-s028 NR150319-1745/14_23-UB (database version 2.30, 255.6.1) {superthreading v1.25}
#@(#)CDS: CeltIC v14.23-s013_1 (64bit) 03/09/2015 04:15:07 (Linux 2.6.18-194.el5)
#@(#)CDS: AAE 14.23-s010 (64bit) 03/20/2015 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 14.23-s014_1 (64bit) Mar  9 2015 03:15:25 (Linux 2.6.18-194.el5)
#@(#)CDS: CPE v14.23-s032
#@(#)CDS: IQRC/TQRC 14.1.6-s260 (64bit) Mon Mar  2 11:26:49 PST 2015 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set init_gnd_net gnd!
set init_lef_file /project/linuxlab/cadence/vendors/VTVT/vtvt_tsmc180/vtvt_tsmc180_lef/vtvt_tsmc180.lef
set init_verilog top.syn.v
set init_mmmc_file Default.view
set init_pwr_net vdd!
init_design
fit
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site CoreSite -r 0.972182741117 0.699995 10.0 10.0 10.0 10.0
uiSetTool select
getIoFlowFlag
fit
clearGlobalNets
globalNetConnect gnd! -type pgpin -pin gnd! -inst * -module {}
clearGlobalNets
globalNetConnect gnd! -type pgpin -pin gnd! -inst * -module {}
globalNetConnect vdd! -type pgpin -pin vdd! -inst * -module {}
clearGlobalNets
globalNetConnect gnd! -type pgpin -pin gnd! -inst * -module {}
globalNetConnect vdd! -type pgpin -pin vdd! -inst * -module {}
set sprCreateIeRingNets {}
set sprCreateIeRingLayers {}
set sprCreateIeRingWidth 1.0
set sprCreateIeRingSpacing 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
addRing -skip_via_on_wire_shape Noshape -skip_via_on_pin Standardcell -stacked_via_top_layer metal6 -type core_rings -jog_distance 0.81 -threshold 0.81 -nets {gnd! vdd!} -follow core -stacked_via_bottom_layer metal1 -layer {bottom metal1 top metal1 right metal2 left metal2} -width 0.45 -spacing 0.45 -offset 0.81
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType center -spacing 0.81 -pin {clk reset}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.27 -pinDepth 0.27 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType center -spacing 0.81 -pin {clk reset}
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.27 -pinDepth 0.27 -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Left -layer 1 -spreadType center -spacing 0.81 -pin {clk reset}
setPinAssignMode -pinEditInBatch false
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { metal1 metal6 } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { metal1 metal6 } -nets { gnd! vdd! } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { metal1 metal6 }
setPlaceMode -fp false
placeDesign
