PROJDIR=${CURDIR}

OUTDIR=out/
OBJDIR=obj/

DEBUG ?= 1
ifeq ($(DEBUG), 1)
	BASE_MODEL=${OBJDIR}keyboard_simplified.stl
else
	BASE_MODEL=keyboard_scanned.obj
endif

SCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD

SILENT=2>&1 >/dev/null

.phony: all dir clean debug

all: ${OUTDIR}keyboard_top.stl ${OUTDIR}controller_clip.stl ${OUTDIR}keyboard_bottom.stl

${OUTDIR}controller_clip.stl : dir
	@echo "Creating controller mounting clip"
	@${SCAD} -o $@ 99-controllerclip.scad ${SILENT}

${OUTDIR}keyboard_bottom.stl : ${OBJDIR}keyboard_bottom_base.stl dir
	@echo "Finalising bottom"
	@${SCAD} -o $@ 10-feet.scad ${SILENT}

${OUTDIR}keyboard_top.stl : ${OBJDIR}keyboard_screwposts.stl ${OBJDIR}keyboard_top_switches.stl dir
	@echo "Finalising top"
	@./meshlabserver_osx -i ${PROJDIR}/${OBJDIR}keyboard_screwposts.stl -i ${PROJDIR}/${OBJDIR}keyboard_top_switches.stl -o ${PROJDIR}/$@ -s ${PROJDIR}/09-combinetop.mlx ${SILENT}

${OBJDIR}keyboard_screwposts.stl : ${OBJDIR}keyboard_1.5shrink.stl dir
	@echo "Adding screw posts"
	@${SCAD} -o $@ 08-top_screwposts.scad ${SILENT}

${OBJDIR}keyboard_top_switches.stl : ${OBJDIR}keyboard_top_cutout.stl dir
	@echo "Fitting keyswitches"
	@${SCAD} -o $@ 07-keyswitches.scad ${SILENT}

${OBJDIR}keyboard_top_cutout.stl : ${OBJDIR}keyboard_top_base.stl dir
	@echo "Cutting out keyswitch base"
	@${SCAD} -o $@ 06-cutouts.scad ${SILENT}

${OBJDIR}keyboard_bottom_base.stl : ${OBJDIR}keyboard_1.5shrink.stl ${OBJDIR}keyboard_2.5shrink.stl dir
	@echo "Creating bottom base model"
	@${SCAD} -o $@ 05-bottom.scad ${SILENT}

${OBJDIR}keyboard_top_base.stl : ${OBJDIR}keyboard_1.5shrink.stl ${OBJDIR}keyboard_2.5shrink.stl dir
	@echo "Creating top base model"
	@${SCAD} -o $@ 04-top.scad ${SILENT}

${OBJDIR}keyboard_2.5shrink.stl : ${OBJDIR}keyboard_scaled.stl dir
	@echo "Creating inner shell"
	@./meshlabserver_osx -i ${PROJDIR}/$< -o ${PROJDIR}/$@ -s ${PROJDIR}/03-shrink-2.5mm.mlx ${SILENT}

${OBJDIR}keyboard_1.5shrink.stl : ${OBJDIR}keyboard_scaled.stl dir
	@echo "Creating outer shell"
	@./meshlabserver_osx -i ${PROJDIR}/$< -o ${PROJDIR}/$@ -s ${PROJDIR}/02-shrink-1.5mm.mlx ${SILENT}

${OBJDIR}keyboard_scaled.stl : ${BASE_MODEL} dir
	@echo "Scaling model to correct dimensions"
	@./meshlabserver_osx -i ${PROJDIR}/$< -o ${PROJDIR}/$@ -s ${PROJDIR}/01-rescale.mlx ${SILENT}

${OBJDIR}keyboard_simplified.stl : keyboard_scanned.obj dir
	@echo "Creating simplified model for testing"
	@./meshlabserver_osx -i ${PROJDIR}/$< -o ${PROJDIR}/$@ -s ${PROJDIR}/00-simplify.mlx ${SILENT}

dir:
	@mkdir -p ${OBJDIR} ${SILENT}
	@mkdir -p ${OUTDIR} ${SILENT}

clean:
	@rm -rf ${OBJDIR} ${SILENT}
	@rm -rf ${OUTDIR} ${SILENT}
