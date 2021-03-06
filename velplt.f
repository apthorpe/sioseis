      SUBROUTINE VELPLT(IBUF,NSAMPS,VEL,VTUPLE)
C     VELPLT PUTS THE VELOCITY SPECTRA SEMBLANCE IN THE VELDAT COMMON ARRAY
C  FOR EACH TRACE SENT IT.  THE SEMBLANCE MUST BE IN IBUF AS 16 BIT INTEGERS.
C  THE VELDAT WILL CONTAIN HOLLERITHS SUITABLE TO BE PRINTED WITH AN A1 FORMAT.
C  THIS IS TABLE DRIVEN BECAUSE ENCODES ARE NOTORIOUSLY SLOW AND EXPENSIVE!
C
C  ARGUMENTS:
C  IBUF  - THE ARRAY OF SEMBLANCES (32 BIT INTEGERS).  IT IS ASSUMED THAT EVERY
C          CALL TO VELPLT STARTS AT THE SAME TIME.
C  NSAMPS - THE NUMBER OF SAMPLES IN THE IBUF ARRAY THAT NEED TO BE PLOTTED.
C  VEL    - THE VELOCITY ASSOCIATED WITH THE ARRAY IN IBUF.  THIS IS USED IN
C           CONJUNCTION WITH VTUPLE TO FIGURE OUT WHICH COLUMN TO USE.
C  VTUPLE - A 3 WORD ARRAY CONTAINING THE START VELOCITY OF THE ANALYSIS, THE
C           END VELOCITY, AND THE NUMBER OF COLUMNS BETWEEN THEM.
C
C
C  WRITTEN AND COPYRIGHTED BY:
C  PAUL HENKART, SCRIPPS INSTITUTION OF OCEANOGRAPHY, 21 MAY 1981
C  ALL RIGHTS ARE RESERVED BY THE AUTHOR.  PERMISSION TO COPY OR REPRODUCE THIS
C  SUBROUTINE, BY COMPUTER OR OTHER MEANS, MAY BE OBTAINED ONLY FROM THE AUTHOR.
C
      DIMENSION VTUPLE(111)
      INTEGER*4 IBUF(111)
      COMMON /VELDAT/IA(900)
      CHARACTER*132 IA
      SAVE
      LOGICAL FIRST
      COMMON /VPLT/ IALPHA(50)
      CHARACTER*1 IALPHA
      DATA FIRST/.TRUE./
C
      IF(.NOT.FIRST) GO TO 10
      FIRST=.FALSE.
      VINC=(VTUPLE(2)-VTUPLE(1))/(VTUPLE(3)-1)
   10 CONTINUE
      ICOL=(VEL-VTUPLE(1))/VINC + 1                                     ! FIGURE OUT WHAT COLUMN THIS VELOCITY IS
      DO 100 I=1,NSAMPS
      IA(I)(ICOL:ICOL)=IALPHA(IBUF(I)+1)
  100 CONTINUE
      RETURN
      END
