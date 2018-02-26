.PHONY: clean 1.basics 2.adts

2.adts:
	ghc 2.adts.hs

0.basics:
	ghc 1.basics.hs
	
clean:
	rm 1.basics 2.adts

