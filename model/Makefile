PROJDIR=${CURDIR}

BASE_MODEL=keyboard_simplified.stl
#BASE_MODEL=keyboard_scanned.obj

SCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

SILENT=>/dev/null

.phony: all

all: keyboard_top_cutout.stl keyboard_bottom_base.stl

keyboard_top_cutout.stl : keyboard_top_base.stl
	@echo "Cutting out keyswitch base"
	@${SCAD} -o $@ 03-cutouts.scad

keyboard_bottom_base.stl : keyboard_1.5shell.stl keyboard_2.5shrink.stl
	@echo "Creating bottom base model"
	@${SCAD} -o $@ 02b-bottom.scad

keyboard_top_base.stl : keyboard_1.5shell.stl keyboard_2.5shrink.stl
	@echo "Creating top base model"
	@${SCAD} -o $@ 02a-top.scad

keyboard_1.5shrink.stl : keyboard_switches.stl
	@echo "Creating outer shell"
	@./meshlabserver_osx -i ${PROJDIR}/$< -o ${PROJDIR}/$@ -s ${PROJDIR}/shrink-1.5mm.mlx ${SILENT}

keyboard_2.5shrink.stl : keyboard_switches.stl
	@echo "Creating inner shell"
	@./meshlabserver_osx -i ${PROJDIR}/$< -o ${PROJDIR}/$@ -s ${PROJDIR}/shrink-2.5mm.mlx ${SILENT}

keyboard_switches.stl : keyboard_scaled.stl
	@echo "Fitting keyswitches"
	@${SCAD} -o $@ 01-keyswitches.scad ${SILENT}

keyboard_scaled.stl : ${BASE_MODEL}
	@echo "Scaling model to correct dimensions"
	@./meshlabserver_osx -q -i ${PROJDIR}/$< -o ${PROJDIR}/$@ -s ${PROJDIR}/rescale.mlx ${SILENT}

keyboard_simplified.stl : keyboard_scanned.obj
	@echo "Creating simplified model for testing"
	@./meshlabserver_osx -q -i ${PROJDIR}/$< -o ${PROJDIR}/$@ -s ${PROJDIR}/simplify.mlx ${SILENT}
