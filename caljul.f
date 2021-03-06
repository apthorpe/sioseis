      SUBROUTINE CALJUL(MONTH,IDAY,IYEAR,JDAY)
C    CALJUL RETURNS THE JULIAN DAY, GIVEN THE CALENDAR DATE IN DAY-MONTH-YEAR.
C  THE JULIAN DAY IS THE DAY NUMBER WITHIN THE YEAR (JANUARY 1 IS DAY, FEBRUARY 1
C  IS DAY 32, ETC.)
C      LEAP YEARS ARE ACCOUNTED FOR.
C
C  ARGUMENTS:
C     MONTH  - THE MONTH NUMBER OF THE CALENDAR DAY TO BE CONVERTED.
C     IDAY   - THE DAY NUMBER OF THE CALENDAR DAY TO BE CONVERTED.
C     IYEAR  - THE YEAR OF THE DAY TO BE CONVERTED.
C     JDAY   - THE JULIAN DAY RETURNED FROM CALJUL.
C
C  CONVERTED FROM THE IBM1800 SYSTEM BY PAUL HENKART, SCRIPPS INSTITUTION OF
C  OCEANOGRAPHY, 28 OCTOBER 1980
C
c  mod 1 Apr 10 - Get rid of arithmetic IF
c
      DIMENSION NDAYS(12)
      DATA NDAYS /0,31,59,90,120,151,181,212,243,273,304,334/
C
      JDAY=NDAYS(MONTH)+IDAY
C
C     TAKE CARE OF LEAP YEARS
C
c      IF(IYEAR-IYEAR/4*4) 3,1,3
c1     IF(MONTH-2) 3,3,2
c2     JDAY=JDAY+1
      IF( iyear .NE. iyear/4*4 ) RETURN
      IF( month .GT. 2 ) jday = jday + 1
3     RETURN
      END
