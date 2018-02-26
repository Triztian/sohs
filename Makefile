.PHONY: clean 1.basics 2.adts 3.rppp

3.rppp:
	ghc 3.rppp.hs

2.adts:
	ghc 2.adts.hs

0.basics:
	ghc 1.basics.hs

	
clean:
	rm 1.basics 2.adts 3.rppp

