	SUBROUTINE ERRUPD(C, SHADERR, NFIT)
	DIMENSION C(NFIT+1, NFIT+1), SHADERR(NFIT)
	DO 2757 I = 1, NFIT
	  SHADERR(I) = C(I,I)**2
2757	CONTINUE
	RETURN
	END
