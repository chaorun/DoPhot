	FUNCTION TOOBRIGHT(BIG, NOISE, NFAST, NSLOW, STARPAR)
	INCLUDE 'TUNEABLE'
	COMMON /SEARCH/ NSTOT,THRESH
	INTEGER*2 BIG(NFAST,NSLOW)
	INTEGER*4 NOISE(NFAST,NSLOW)
	DIMENSION STARPAR(NPMAX), A(NPMAX)
	LOGICAL TOOBRIGHT, FLAG
	INTEGER*2 JRECT(4)
	DATA MAGIC / 2147483647/
	TOOBRIGHT = .FALSE.
c
c  Changed index.
c
	IF (STARPAR(2) .LT. ITOP/4) THEN
c
	  RETURN
	ELSE
	  NSAT = 0
	  DUM = GUESS2(A, STARPAR, IX, IY)
	  IXHI = MIN0(IFIX(IX + KRECT(1)/2 + 0.5), NFAST - N0RIGHT)
	  IXLO = MAX0(IFIX(IX - KRECT(1)/2 + 0.5), 1 + N0LEFT)
	  IYHI = MIN0(IFIX(IY + KRECT(2)/2 + 0.5), NSLOW)
	  IYLO = MAX0(IFIX(IY - KRECT(2)/2 + 0.5), 1)
	  DO 2757 JY = IYLO, IYHI
	    DO 2758 JX = IXLO, IXHI
	      IF (NOISE(JX, JY) .EQ. MAGIC) then
		if (big(jx, jy) .gt. itop) nsat = nsat + 1
              end if
2758	    CONTINUE
2757	  CONTINUE
	END IF
c
c  Changed index.
c
	FLAG = (STARPAR(2) .GT. CMAX) .OR. (NSAT .GE. ICRIT)
c
	IF (FLAG) THEN
	  TOOBRIGHT = .TRUE.
c
c  Changed index.
c
	  if (nsat .ge. icrit)  STARPAR(2) = CTPERSAT*NSAT
c
	  CALL OBLIMS(STARPAR,JRECT)
	  STARPAR(5) = JRECT(2) - JRECT(1)
	  STARPAR(6) = NSAT
	  STARPAR(7) = JRECT(4) - JRECT(3)
	if(lverb.gt.10) then
	 write(6,*) NSAT, ' SATURATED PIXELS in object at:', IX,IY 
	end if
	END IF
	RETURN
	END