      SUBROUTINE EBCASC( STRIN, NCHARS, STROUT )
C   EBCASC CONVERTS AN EBCDIC STRING TO AND ASCII STRING.  UNKNOWN CHARACTERS
C ARE REPLACED WITH A QUESTION MARK (?).
C
C  ARGUMENTS:
C     STRIN  - THE STRING OF EBCDIC CHARACTERS TO BE CONVERTED.  STRIN must be
C              DECLARED  CHARACTER.
C     NCHARS - THE NUMBER OF CHARACTERS TO CONVERT.
C     STROUT - THE OUTPUT ARRAY OF ASCII CHARACTERS.  ISTROU MAY BE THE SAME AS
C              STRIN.   STROUT must be type CHARACTER
C
C  WRITTEN AND COPYRIGHTED (C) BY:
C  PAUL HENKART, SCRIPPS INSTITUTION OF OCEANOGRAPHY, 4 MAY 1984
C  ALL RIGHTS ARE RESERVED BY THE AUTHOR.  PERMISSION TO COPY OR REPRODUCE THIS
C  SUBROUTINE, BY COMPUTER OR OTHER MEANS, MAY BE OBTAINED ONLY FROM THE AUTHOR.
C
      INTEGER IEBC(256)
      CHARACTER*(*) strin, strout
      DATA IEBC/
     *  1,2,3,63,9,63,16,63,63,63,11,12,13,14,15,16,17,18,19,
     *  63,63,08,63,24,25,63,63,63,63,63,63,63,63,28,63,63,10,23,27,
     *  63,63,63,63,63,05,06,07,00,00,22,00,63,30,63,04,63,63,63,63,
     *  20,21,00,26,32,63,63,63,63,63,63,63,63,63,63,46,60,40,43,124,
     *  38,63,63,63,63,63,63,63,63,63,33,36,42,41,59,95,45,47,63,63,
     *  63,63,63,63,63,63,63,44,37,95,62,63,63,63,63,63,63,63,63,63,
     *  63,96,58,35,64,39,61,34,63,97,98,99,100,101,102,103,104,105,
     *  63,63,63,63,63,63,63,106,107,108,109,110,
     *  111,112,113,114,63,63,63,63,63,63,
     *  63,126,115,116,117,118,119,120,121,122,
     *  63,63,63,91,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,93,
     *  63,63,123,65,66,67,68,69,70,71,72,73,63,63,63,63,63,63,125,74,
     *  75,76,77,78,79,80,81,82,63,63,63,63,63,63,92,63,83,84,85,86,
     *  87,88,89,90,63,63,63,63,63,63,48,49,50,51,52,53,54,55,56,57,
     *  124,63,63,63,63,63,63/
C
      i = 1
   10 ichr = IAND(ICHAR(strin(i:i)),255)
      strout(i:i) = CHAR(iebc(ichr))
      i = i + 1
      IF( i .GT. nchars ) RETURN
      GOTO 10
      END
