CC = gcc
CFLAGS = -g -std=gnu99 -Wall
CUNIT = -L/home/ff/cs61c/cunit/install/lib -I/home/ff/cs61c/cunit/install/include -lcunit
ASSEMBLER_FILES = src/utils.c src/tables.c src/translate_utils.c src/translate.c

all: assembler

check: test-assembler


test-diff: assembler test-simple test-combined test-comments test-imm test-jumps test-labels test-pseudo test-pseudo-2 test-rtypes test-sum test-negate-array test-p1-errors test-p2-errors

test-simple: 
	@echo "Testing simple.s"
	./assembler input/simple.s out/simple.int out/simple.out
	diff -Z out/simple.int out/ref/simple_ref.int
	diff -Z out/simple.out out/ref/simple_ref.out
	@echo "There should be no lines printed below the diff commands if you passed the test"
	@echo ""

test-combined:
	@echo "Testing combined.s"
	./assembler input/combined.s out/combined.int out/combined.out
	diff -Z out/combined.int out/ref/combined_ref.int
	diff -Z out/combined.out out/ref/combined_ref.out
	@echo "There should be no lines printed below the diff commands if you passed the test"
	@echo ""

test-comments:
	@echo "Testing comments.s"
	./assembler input/comments.s out/comments.int out/comments.out
	diff -Z out/comments.int out/ref/comments_ref.int
	diff -Z out/comments.out out/ref/comments_ref.out
	@echo "There should be no lines printed below the diff commands if you passed the test"
	@echo ""

test-imm:
	@echo "Testing imm.s"
	./assembler input/imm.s out/imm.int out/imm.out
	diff -Z out/imm.int out/ref/imm_ref.int
	diff -Z out/imm.out out/ref/imm_ref.out
	@echo "There should be no lines printed below the diff commands if you passed the test"
	@echo ""

test-jumps:
	@echo "Testing jumps.s"
	./assembler input/jumps.s out/jumps.int out/jumps.out
	diff -Z out/jumps.int out/ref/jumps_ref.int
	diff -Z out/jumps.out out/ref/jumps_ref.out
	@echo "There should be no lines printed below the diff commands if you passed the test"
	@echo ""

test-labels:
	@echo "Testing labels.s"
	./assembler input/labels.s out/labels.int out/labels.out
	diff -Z out/labels.int out/ref/labels_ref.int
	diff -Z out/labels.out out/ref/labels_ref.out
	@echo "There should be no lines printed below the diff commands if you passed the test"
	@echo ""

test-pseudo:
	@echo "Testing pseudo.s"
	./assembler input/pseudo.s out/pseudo.int out/pseudo.out
	diff -Z out/pseudo.int out/ref/pseudo_ref.int
	diff -Z out/pseudo.out out/ref/pseudo_ref.out
	@echo "There should be no lines printed below the diff commands if you passed the test"
	@echo ""

test-pseudo-2:
	@echo "Testing pseudo_2.s"
	./assembler input/pseudo_2.s out/pseudo_2.int out/pseudo_2.out
	diff -Z out/pseudo_2.int out/ref/pseudo_2_ref.int
	diff -Z out/pseudo_2.out out/ref/pseudo_2_ref.out
	@echo "There should be no lines printed below the diff commands if you passed the test"
	@echo ""

test-rtypes:
	@echo "Testing rtypes.s"
	./assembler input/rtypes.s out/rtypes.int out/rtypes.out
	diff -Z out/rtypes.int out/ref/rtypes_ref.int
	diff -Z out/rtypes.out out/ref/rtypes_ref.out
	@echo "There should be no lines printed below the diff commands if you passed the test"
	@echo ""

test-sum: 
	@echo "Testing sum.s"
	./assembler input/sum.s out/sum.int out/sum.out
	diff -Z out/sum.int out/ref/sum_ref.int
	diff -Z out/sum.out out/ref/sum_ref.out
	@echo "There should be no lines printed below the diff commands if you passed the test"
	@echo ""

test-negate-array: 
	@echo "Testing negate_array.s"
	./assembler input/negate_array.s out/negate_array.int out/negate_array.out
	diff -Z out/negate_array.int out/ref/negate_array_ref.int
	diff -Z out/negate_array.out out/ref/negate_array_ref.out
	@echo "There should be no lines printed below the diff commands if you passed the test"
	@echo ""

test-p1-errors:
	@echo "Testing p1-errors.s"
	-./assembler -p1 input/p1_errors.s out/p1_errors.int -log log/p1_errors.txt
	diff log/p1_errors.txt log/ref/p1_errors_ref.txt
	@echo "There should be no lines printed below the diff commands if you passed the test"
	@echo ""

test-p2-errors:
	@echo "Testing p2-errors.s"
	-./assembler input/p2_errors.s out/p2_errors.int out/p2_errors.out -log log/p2_errors.txt
	diff log/p2_errors.txt log/ref/p2_errors_ref.txt
	@echo "There should be no lines printed below the diff commands if you passed the test"
	@echo ""

assembler: clean
	$(CC) $(CFLAGS) -o assembler assembler.c $(ASSEMBLER_FILES)

test-assembler: clean
	$(CC) $(CFLAGS) -DTESTING -o test-assembler test_assembler.c $(ASSEMBLER_FILES) $(CUNIT)
	./test-assembler

clean:
	rm -f *.o assembler test-assembler core
