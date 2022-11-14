LATEX=pdflatex
LATEXOPT=--shell-escape -synctex=1 --enable-write18
NONSTOP=--interaction=nonstopmode

STUDENTOPT="\PassOptionsToClass{student,landscape,twocolumn}{beamerarticle-teacher}\input{%S}"
TEACHEROPT="\PassOptionsToClass{teacher,landscape,twocolumn}{beamerarticle-teacher}\input{%S}"
BEAMEROPT="\PassOptionsToClass{beamer}{beamerarticle-teacher}\input{%S}"

STUDENTSUFF=ELEV
TEACHERSUFF=PROF
BEAMERSUFF=PRES

LATEXMK=latexmk
LATEXMKOPT=-pdf
CONTINUOUS=-pvc

USBDIR=/Volumes/BENOIT/00-ENCOURS
USBPRINTDIR=/Volumes/BENOIT/00-TOPRINT
CLOUDDIR=/Users/benoit/ownCloud/COURS

CSTUDENT: $(TEXSRC).tex
	$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS)\
	  -pdflatex='$(LATEX) $(LATEXOPT) $(NONSTOP) %O $(STUDENTOPT)' -jobname='$(TEXSRC)-$(STUDENTSUFF)' $(STUDENT)

CTEACHER:$(TEXSRC).tex
	$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS)\
	  -pdflatex='$(LATEX) $(LATEXOPT) $(NONSTOP) %O $(TEACHEROPT)' -jobname='$(TEXSRC)-$(TEACHERSUFF)' $(TEACHER)

CBEAMER:$(TEXSRC).tex
	$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS)\
	  -pdflatex='$(LATEX) $(LATEXOPT) $(NONSTOP) %O $(BEAMEROPT)' -jobname='$(TEXSRC)-$(BEAMERSUFF)' $(BEAMER)

STUDENT: $(TEXSRC).tex
	$(LATEXMK) $(LATEXMKOPT) \
	  -pdflatex='$(LATEX) $(LATEXOPT) $(NONSTOP) %O $(STUDENTOPT)' -jobname='$(TEXSRC)-$(STUDENTSUFF)' $(STUDENT)

TEACHER:$(TEXSRC).tex
	$(LATEXMK) $(LATEXMKOPT) \
	  -pdflatex='$(LATEX) $(LATEXOPT) $(NONSTOP) %O $(TEACHEROPT)' -jobname='$(TEXSRC)-$(TEACHERSUFF)' $(TEACHER)

BEAMER:$(TEXSRC).tex
	$(LATEXMK) $(LATEXMKOPT) \
	  -pdflatex='$(LATEX) $(LATEXOPT) $(NONSTOP) %O $(BEAMEROPT)' -jobname='$(TEXSRC)-$(BEAMERSUFF)' $(BEAMER)

article: $(TEXSRC).tex
	make STUDENT
	make TEACHER

all: $(TEXSRC).tex
	make STUDENT
	make TEACHER
	make BEAMER

usb-student:
	cp $(TEXSRC)-$(STUDENTSUFF).pdf $(USBDIR)
	ps2pdf $(USBDIR)/$(TEXSRC)-$(STUDENTSUFF).pdf $(USBPRINTDIR)/$(TEXSRC)-$(STUDENTSUFF).pdf

usb-teacher:
	cp $(TEXSRC)-$(TEACHERSUFF).pdf $(USBDIR)
	ps2pdf $(USBDIR)/$(TEXSRC)-$(TEACHERSUFF).pdf $(USBPRINTDIR)/$(TEXSRC)-$(TEACHERSUFF).pdf

usb-beamer:
	cp $(TEXSRC)-$(BEAMERSUFF).pdf $(USBDIR)

usb-all:
	make usb-student
	make usb-teacher
	make usb-beamer

cloud-student:
	make STUDENT
	cp $(TEXSRC)-$(STUDENTSUFF).pdf $(CLOUDDIR)/$(GRADE)

cloud-teacher:
	make TEACHER
	cp $(TEXSRC)-$(TEACHERSUFF).pdf $(CLOUDDIR)/$(GRADE)

cloud-beamer:
	make BEAMER
	cp $(TEXSRC)-$(BEAMERSUFF).pdf $(CLOUDDIR)/$(GRADE)

cloud-all:
	make cloud-student
	make cloud-teacher
	make cloud-beamer

cloud-article:
	make cloud-student
	make cloud-teacher

clean:
	rm -rf *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.maf *.mtc* *.out *.run.xml *.synctex.gz *.nav *.toc *.snm *.gnuplot *.thm *.vrb *.table

cleanall:
	make clean
	rm -rf *.pdf
	rm -rf *.dvi
