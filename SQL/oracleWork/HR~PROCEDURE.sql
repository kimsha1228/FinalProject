CREATE OR REPLACE PROCEDURE SAMPLE1_INSERT AS
BEGIN
  for i in 1..50 loop --50번 루프 돌겟다!
  INSERT INTO sample1(
            num, fname, lname, tel, addr
        ) values(
            sample1_seq.nextval,
            dbms_random.string('A',10),
            dbms_random.string('Q',10),
            '010-0000-0000',
            'seoul'
        );
  end loop; --for문 끝
  commit; --최종으로 커밋함
END;
/