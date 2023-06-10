-- tour DDL --

-- DROP SCHEMA tourapi;
CREATE SCHEMA tourapi;
USE tourapi;
 
CREATE TABLE MEMBER (
    mNO 	 INT  PRIMARY KEY AUTO_INCREMENT,
    ID 		 VARCHAR(30) NOT NULL UNIQUE,
    PASSWORD VARCHAR(100) NOT NULL,
    ROLE 	 VARCHAR(10) DEFAULT 'ROLE_USER',
    NAME 	 VARCHAR(15) NOT NULL,
    PHONE 	 VARCHAR(13),
    EMAIL 	 VARCHAR(100),
    ADDRESS  VARCHAR(100),
    HOBBY 	 VARCHAR(100),
    KAKAOTOKEN	VARCHAR(1000),
    STATUS 	 VARCHAR(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
    ENROLL_DATE DATETIME  DEFAULT CURRENT_TIMESTAMP,
    MODIFY_DATE DATETIME DEFAULT CURRENT_TIMESTAMP
);



INSERT INTO MEMBER (
    mNO, 
    ID, 
    PASSWORD, 
    ROLE,
    NAME, 
    PHONE, 
    EMAIL, 
    ADDRESS, 
    HOBBY, 
    KAKAOTOKEN,
    STATUS, 
    ENROLL_DATE, 
    MODIFY_DATE
) VALUES(
    0, 
    'admin', 
    '1234', 
    'ROLE_ADMIN', 
    '관리자', 
    '010-1234-4341', 
    'admin@test.com', 
    '서울시 강남구 역삼동',
    DEFAULT,
    DEFAULT,
    DEFAULT,
    DEFAULT,
    DEFAULT
);

COMMIT;
SELECT * FROM MEMBER;
 
-------------------------------------------------
--------------- Board 관련 테이블 ------------------
-------------------------------------------------
CREATE TABLE BOARD (	
    bNO INT AUTO_INCREMENT,
    mNO INT,
    contenttypeid INT,
	TITLE VARCHAR(1000), 
	CONTENT VARCHAR(2000), 
	TYPE VARCHAR(100), 
	ORIGINAL_FILENAME VARCHAR(100), 
	RENAMED_FILENAME VARCHAR(100), 
	READCOUNT INT DEFAULT 0, 
    STATUS VARCHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
    CREATE_DATE DATETIME  DEFAULT CURRENT_TIMESTAMP, 
    MODIFY_DATE DATETIME  DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_BOARD_NO PRIMARY KEY(bNO),
    CONSTRAINT FK_BOARD_WRITER FOREIGN KEY(mNO) REFERENCES MEMBER(mNO) ON DELETE SET NULL
);


-- use tourapi;
-- drop table board;
select * from board;
select count(*) from board where contenttypeid=39;

 -- B1:맛집  B2: 핫플  B3: 숙소
INSERT INTO BOARD VALUES(0, 1, 39, '[홍대맛집/연남동맛집] 미쁘동 -토마토 연어국수JMT 내돈내산 솔직후기',  '안녕하세요! 오늘은 오랜만에 연남동에 다녀왔어요 :D 어디갈까 엄청 고민하다가 카카오 플친으로 예약 가능한 일식 레스토랑 미쁘동을 예약했는데요 후기를 남겨볼게요. 미쁘동은 핫플이라 예약 안하면 웨이팅이 너무 길어서 예약 꼭 하고가시길 추천해요. 미쁘동 외관의 모습은 2층에 있고 내부는 넓지 않아요. 그래도 화이트톤의 따뜻한 느낌의 인테리어! 저희는 4명이서 토마토 연어국수, 새우튀김 8pcs, 미쁘동 연어추가, 미쁘소바, 연어장정식을 시켰어요. 회사끝나고 엄청 배고팠기에 잔뜩 욕심냄 음식이 나오고 먹어봤는데 완전 맛있었어요. 아 참고로 인스타에 업로드하면 우니크림 고로케2pcs 주는 이벤트 중이니 잘 챙겨보세요! 음식이 나오고 먹어봤는데 여기는 진짜 찐맛 존맛탱이랍니다. 꼭 가시길 추천합니다.', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 39, '마곡 서울 식물원 맛집 돼슐랭 김치삼겹살 후기 (마곡나루역 고기집)',  '줌바댄스 배우러 마곡나루 갈 때마다 늘 지나치게 되는 이곳 돼슐랭 평일저녁이면 근처 직장인들로 늘 사람이 바글바글하던 곳이었어요. 나중에 한번쯤 와야지 했던 곳인데 결국 오게되네요 먹고 마곡식물원도 가면 되요! 서울식물원 맛집 돼슐랭은요렇게  조명도 예쁘고 내부도 깔끔 + 쾌적한 공간이라서여성분들이 좋아하실 것 같아요~ 커플이 오면 좋은 분위기랄까! 저희는 삼겹살, 오겹살, 꽃목살을 시키고 된장찌개도 추가했어요. 삼겹살 나오자마자 판위에 요렇게 줄 지워 구워주셨어요.. 일단 냄새부터 아휴.. ㅠㅠ 고기 한점도 안먹었는데 익은 김치냄새에 군침이 주륵주륵 흘렀어요.. 다익자마자 제가 제일 좋아하는 멜젓부터 콕 찍고 먹어봤는데 진짜 진짜 맛을 표현할 수 가 없다(?) 정말 맛있더라구요 꼭 추천합니다/.', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 39, '노량진 형제상회 솔직후기',  '안녕하세요. 오늘은 오랜만에 노량진 수산시장 숙성회 맛집 추천을 드리고자 왔습니다. 소개해 드릴 곳은 워낙 노량진 수산시장에서 유명한 숙성회 맛집이고, 저희 부부가 숙성회가 먹고 싶을때 종종 가던 곳입니다. 이말은, 이곳 가시면 최소 평균 이상의 맛은 보장되어 있으며 실패할 확률이 낮은곳이에요! 노량진 수산시장은 아직도 호객행위가 있기 때문에, 미리 갈곳을 알아보고 오지 않는다면, 호객행위를 하는 상점들이 많이 불편할 수 도 있습니다. 노량진 형제상회는 노량진 수산시장중에서도 인기가 많은 노량진 맛집으로, 예약을 안하고 가시면 대기 시간이 생각보다 길어 질 수도 있습니다. 때문에 평일 저녁이라든지, 주말에는 예약을 하고 가시는것을 추천드립니다만 저희남편이 연어뱃살을 좋아해서 시켰는데... 너무 맛있어서 제가 혼자 다먹어버렸어요 ㅎㅎ 먹느라 바쁜데, 너무 맛있어서 사진찍기도 바빴어요. 둘이 너무 많이 먹어서 만삭이 됐을정도에요..!', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 39, '한남동 공기 다녀온 후기- 한남동맛집 한식 추천',  '오늘은 한남동 맛집인 공기 다녀온 리뷰 말씀드릴게요. 공기는 한남동에 위치해 있으며, 자차로 가셔도 좋고 대중교통을 이용하셔도 됩니다. 만약에 지하철을 이용하시면 이태원역 2번 출구로 나오셔서 10분정도 쭈욱 걸어 나오시면 됩니다. 참고로 가시기전에 "공기"에 예약을 하고 가시는것을 추천드려요! 한남동에서 인기가 많은 곳이라 예약이 꽉 차 있는 경우가 많습니다. 입구에서부터 공기만의 시그니처 문양이 보이기 시작하네요 사장님께서 공기글씨도 굉장히 감성있게 디자인하신것 같아요 한우채끝 등심구이가 나왔는데 등심위에는 고추냉이가 올라가져 있고 주위에는 소금이 뿌려져 있어요. 비주얼적으로 굉장히 공기다운 비주얼이었고 식감 자체도 부드러운 편이었어요. 기본적으로 간이 조금 되어있는데 기호에 따라 주변에 소금을 찍어드셔도됩니다. 두번째메뉴ㅜㄴ', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 39, '송계옥 교대점 후기:: 오픈런해서 간 송계옥은 교대역 맛집으로 좋은 선택',  '송계옥 교대점에 왔습니다. 그동안 성수, 잠실 지점을 가봤는데 교대 지점은 처음이었다. 근데 최근에 알게 된 것인데 안국에도 송계옥이 오픈했다고! 거기는 웨이팅 안 한다고 했다. 송계옥을 편하게 즐기기 위해서 오후에 오픈하는 시간에 맞춰서 딱 맞게 갔습니다. 그래서 앞에서 살짝 기다렸다. 근데 입구에서 왼쪽으로 가면 이렇게 웨이팅 장소가 있어서 딱이다. 더웠는데 에어컨 틀어줘서 딱이었다. 가격은 이렇게 되어있다. 3명이서 왔으니까 모둠 대로 시키고 사이드 메뉴 2가지 주문하면 딱이다. 다른 지점과 같은 구도라서 딱히 크게 다른 점은 없습니다. 고기도 직원이 와서 구워준다. 근데 아무래도 일하는 사람은 점바점 차이가 꽤 있는 것 같다. 여긴 살짝 불호였어요 제일 친절한 건 역시 잠실임! 세팅 완료입니당 송계옥에서 먹을 수 있는 반찬과 고기에 곁들여서 먹는 양념! 개인적으로는 마늘 양념이 제일 좋다. 마셔보고 싶어서 주문한 얼그레이 하이볼! 근데 예상과 살짝 다른 맛이었다. 잘 섞고 나서 다시 한 입 마시니까 원래 맛을 찾아간 것 같기도? 근데 이것도 잠실이 더 맛있었다. 그래서 이거는 친구 마시라고 주고 나머지 둘이서는 소주 마셨다. 샤랄라 해 보이게 찍기 송계옥 모둠 대자가 나왔습니다. 닭의 여러 부위를 한 번에 먹을 수 있어서 좋은 송계옥 모둠  나중에 가족들이랑 꼭 먹어보고 싶다. 매번 친구들이랑 와서 가족들이랑도 먹어보고 싶은 마음이랄까. 부위 설명과 함께 구워주는 것이 시작된다. 다른 테이블과 함께 관리되기 때문에 중간에 너무 타길래 건드린다면 와서 만지지 말라고 한다. 첫 시작은 염통입니다. 이게 그렇게 쫄깃하니 맛있다. 술안주로 딱인 친구! 그리고 연골을 어떻게 먹어 싶었는데 이것도 역시나 맛있구요... 닭 가슴살이랑 다리 살이랑 해서 맛있게 잘 구워 먹었다. 의성 마늘 볶음밥이 나왔습니다. 위에 치즈에다가 마늘 칩이 가득임. 근데 양이 그렇게 많지는 않다. 그리고 꼭 먹어야 하는 비빔면까지 완벽하게 다 부셨다. 근데 이렇게 끝내기 아쉬워서 사이 양념 1인분을 추가했다. 근데 이게 제일 별로였던 것 같다. 차라리 추가할 거면 염통 추가하세요 양념이 그다지 잘 안 어울리는 기분...짤 수 없지 그래도 다른 건 다 맛있었으니까! 건너에 있던 디저트39에 가서 음료 한 잔씩 했는데 사이즈 대박이다.... 강제 두루미 체험 꿀잼 얼음이 그만큼 많기도 했었지만 그래도 음료 양이 대박이었던 디저트39 솔직히 크로칸슈 먹으러 왔는데 먹으러 온 보람이 있었다. 마무리까지 좋았던 우리의 송계옥 나들이 끝!!',  'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 39, '홍대 연남 맛집 카쿠시타 연남카츠와 모츠나베 강력추천',  '맛있는 것이 먹고 싶을 때에는 연남동으로 향하면 대부분의 성공을 할 수 있는 곳이다. 그래서 연남동에 왔다가 가게 된 카쿠시타! 다들 홍대 연남 맛집인 것은 어떻게 알고 이미 안에는 사람들이 가득했다. 메뉴판은 이렇게 되어있다. 메뉴가 워낙 다양해서 고민했다. 그래도 주문 완료! 주문하자 마자 샐러드가 나왔는데 샐러드가 마치 메인 같은...? 내가 좋아하는 드레싱인데다가 가라아게 치킨이 올라갔다. 알새우칩까지 완벽한 조화를 이루는 샐러드가 기본이라니... 이미 샐러드만으로도 배가 부른 느낌,, 이지만 이겨내고 메인을 먹겠어요 모츠 나베가 뭔지 몰랐었는데 보니까 진짜 대박인 나베다. 일단 위에만 봤을 때에는 버섯과 순두부가 있어서 술안주로 딱이네 싶었다. 근데 덜어서 보니까 보이는 대창! 제가 또 대창을 좋아하는 것은 어떻게 아시고 대창이 가득한 건지 대창이 정말 끊임없이 나와서 굉장히 놀랐던 모츠 나베라서 꼭 주문하는 것 추천! 여기에 명란 크림 우동을 추가했습니다. 바게트 빵이 있어서 크림에 찍어 먹고 명란젓이 옆에 더 있어서 그걸 발라먹기도 했다. 솔직히 이렇게 꾸덕한 크림은 그냥 점심에 먹어도 맛있다. 근데 여기에 하이볼을 곁들이면 완전 딱임. 크림 우동도 꼭 주문하는 것 추천! 여기에 마지막으로 추가한 것은 이름도 찬란한 연남카츠 카쿠시타에서 맛있게 먹을 수 있는 치킨카츠이다. 촉촉하게 간장 소스가 뿌려진 듯! 홍대 연남 맛집 카쿠시타의 근본 메뉴 연남카츠 꼭 주문하세요...', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 39, '성수 서울숲 맛집 진작다이닝:: 깔끔한 후토마키와 독특한 파스타',  '성수동의 공장을 개조해서 만든 을지로의 맛집 진작이 성수에 진작다이닝으로 자리 잡고 있다. 그래서 바로 가야겠다는 생각이 들어서 왔다. 웨이팅이 많다고 들어서 주말 저녁 5시 40분쯤에 갔는데 다행히 웨이팅 없이 들어갔다. 메뉴는 음식 사진이 있어서 자세히 볼 수 있어서 좋았다.고민하다가 메뉴 3가지로 주문했다. 2인 테이블이라서 다 들어갈지 살짝 걱정했는데 안착했다^^ 비주얼은 뭐 거의 극락임 꽁다리 포함해서 5조각이라서 2명이서 나눠 먹기는 조금 애매하다. 그럴 때에는 꽁다리 하나, 그냥 하나 그리고 다른 사람이 3조각 먹는 것이그나마 비율이 좋지 않을까 생각한다. 후토마키는 한입에 사라지는 것이 아쉽다. 각 재료를 느끼면 좋을 텐데 후토마키는 그렇게 먹는 것이 아니니까..! 후토마키는 한 접시가 식사라기보다는 곁들여 먹는 반찬 같은 존재이고 모둠카츠와 파스타가 메인으로 주문했다. 진작다이닝 모둠카츠 모둠카츠 구성은 이렇게 되어있다. 한 가지 아쉬운 것이라면 밥과 찌개 추가는 별도 금액을 내고 먹어야 한다는 것이다. 근데 파스타 있어서 패스했다. 모둠카츠는 18,900원인데 가성비가 떨어진다는 생각은 든다. 근데 구성 보면 그 가격이 맞긴 함;;  조각 먹었지만 등심 4조각에 에비후라이랑 고기 고로케 각 1개 안심 2조각으로 구성되었으니 또 맞는 것 같기도 하고....근데 가성비를 생각하게 된 것이 전문적으로 돈까스를 하는 곳이 아니라 살짝 돼지 냄새가 나는 것 같았다. 카츠보다는 후토마키를 두 접시 먹겠어요샐러드는 맛있다.풀은 언제나 옳다. 진작다이닝 단새우 쯔케 파스타 파스타는 다른 곳에서 쉽게 못 먹는메뉴들로 구성되어 있어서꼭 먹어보고자 했다. 그래서 고르게 된 단새우 쯔케 파스타! 많은 수공이 들어갔다기보다는 위에 올라간 단새우와 특제 소스가 어우러지는 냉파스타이다. 특제 소스에다가 찍어 먹어도 되고 부어먹어도 된다고 해서 냅다 부어버린 우리 안에 깔린 오이와 유부와 같이 먹으니 특제 소스가 왜 특제인지 알 수 있었다. 이렇게 맛이 배도록 부어먹는 것을 추천드리는 쯔케 파스타! 다음번에는 크림 명란 까르보나라를 시도해 보아야겠다. 사람들이많아서왜많은지 성수의 분위기를 고대로 느낄 수 있어서 좋았던 진작 다이닝! 다음번에 가면 후토마키와 다른 파스타를 한 번 시도해 보는 것으로! ', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 39, '대학로 맛집 편백나무 찜 먹기 좋은 도토리편백집 혜화',  '편백나무찜은 한번도 안먹어본 것 같다. 샤브샤브는 먹어봤어도 말이다. 그래서 오게 된 도토리 편백집 혜화점! 통후추가 들어간 육수가 나오고 밑반찬도 준비되었다. 밑반찬은 아까 봤던 셀프바에서 원하는대로 가져다가 먹을 수 있다. 편백찜 통이 나오고 타이머가 세팅된다. 9분20초정도 익히면 되고 증기가 뜨거우니까 손대지 말라고 한다. 타이머 다되면 직원이 와서 열어줌! 다 되면 기름기가 쫙 올라와 있어서 영롱한 이베리코 돼지고기! 바닥아래는 숙주나물이 잔뜩 깔려있다.! 야채는 조금 들어있는 편! 무쌈이랑 같이 먹으면 딱이었다. 소스에 마늘 살짝 넣어서 만들면 고기랑 진짜 잘어울린당 죽같은경우는 직원이 요리해주는데 죽이 아니라 볶음밥 수준으로 만들어 우리가 추가로 국물을 넣었음 ㅋ ', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 39, '성북동 맛집 백숙은 역시 성북동 누룽지백숙 :: 메밀전과 함께먹는 세트',  '성북동 쪽으로 내려가니까 생각이 난 성북동 누룽지백숙 오늘 저녁은 백숙이다 그러고 바로 먹으러 왔다. 사람들은 굉장히 테트리스처럼 밀어넣는편이다. 백숙을 먹기 위한 심플한 세팅이 아주 바람직하게 이루어졌다. 메밀전이 나왔는데 피자8조각 썰린거마냥 나왔다. 거기에 가운데에 있는 메밀이랑 돈나물이랑 싸서 먹으면 딱이다. 쫀뜩한 전에다가 새콤한 초장을 곁들여서 간장 콕 찍으면 딱이다. 닭백숙이 나왔는데 인삼, 마늘 대추도 보인다. 밥알도 안에 있어서 맛있어보였다. 1차적으로 닭고기를 열심히 뜯어 먹었다. 양이 엄청나게 많아서 2명에서는 다 못먹는다고 생각한다. 남은 닭고기는 누룽지랑 같이 먹으면 일품이다.!', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 39, '구욱희씨 :: 분위기 진짜 좋은 성수동 서울숲 카페',  '서울숲 에피타이트에와서 서울숲 한바퀴 돌고나서 카페에 들어가기로 했다. 근데 결과적으로 정말 한바퀴 돌아서 다시 애피타이트로 와서 바로 앞에 있던 구욱희씨로 들어갔다. 알고보니 나혼산에도 나왔었다. 음료메뉴는 서울숲 가격에 맞게 맞추어져 있다고 한다. 초코라떼와 딸기에이드를 먹었다. 일단 디저트다 보니 비쥬얼이 대박! 그자체!  구운과자도 진짜 많았다. 쿠키와 스콘 그리고 파운드도 있었다. 3층짜리 건물이었는데 우리는 2층에 자리 잡았다. 테이블은 많은데 사람도 많은편! 음료가 나왔는데 발로나 초코라떼에는 초코와 엠엔엠즈가 들어가있다. 근데 친구가 싫어서 엠엔에즈 버렸음... ㅋㅋ 그리고 그 초콜릿 내가 다먹었다! 딸기에이드 안에는 딸기가 많이 들어있는편! 전반적으로 맛있었다. 나는 그중 엠엔엔즈쪽.. 취향 ', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 39, '연남동 맛집:: 소이연남 소고기 국수 맛보다',  '오전에 조앤도슨 오픈런 성공하고 배가 조금 고파서 먹으러 간 소이연남 소고기 국수! 조앤도슨도 맛있어서 추천드립니다 주말에 오후 1시쯤에 갔더니 살짝 웨이팅하고 들어갔다. 그리고 우리가 다 먹어갈 때쯤에는 브레이크 타임 걸고 손님을 안 받았다 매장 내부는 태국의 여러 가지가 붙어있었다. 그리고 벽이나 테이블이나 의자나 노상 식당 느낌이 났다. 근데 개인적으로는 태국보다는 베트남 같은 느낌의 실내 인테리어였다고 합니다. 주문은 밖에 줄 서 있다가 키오스크로 하고 들어가면 된다. 뼈 국수가 궁금했는데 솔드아웃ㅠ 특이하게 국수 면 굵기를 선택할 수 있다. 얇은 건 진짜 얇고 중간 면이 흔히 아는 그 면이다. 주문은 밖에 줄 서 있다가 키오스크로 하고 들어가면 된다. 뼈 국수가 궁금했는데 솔드아웃ㅠ 특이하게 국수 면 굵기를 선택할 수 있다. 얇은 건 진짜 얇고 중간 면이 흔히 아는 그 면이다. 위에 숙주나물이랑 마늘 조각이 올라간다. 국물에 잘 담가서 익혀주어요 고기가 굉장히 맛있었다. 야들야들하니 딱이었습니다. 이럴 때 사용하는 친구 사진 비주얼을 스노우 필터 들어간 것처럼 굉장히 맛있게 보이게 된다. ', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 39, '[압구정 맛집/브런치] 부베트 서울- 압구정 핫플 솔직후기',  '작년여름에 오픈해서 인스타/유투브에서 엄청 핫한 그곳! 뉴욕,런던,파리 등에 있는 부베트가 서울에 오픈했어요. 오픈시점에는 웨이팅이 너무 심하고, 예약도 어려워서 오픈빨이 조금 빠진 것 같은 지난 주말 브런치로 다녀왔습니다. 부베트는 주차지원이 없어요. 압구정/청담 주차비 사악한거는 아시죠..? 압구정역에서 가까워서 대중교통을 이용했습니다. 압구정 3번출구에서 쭉 걸어가다보면 요렇게 빨간 천막과 부베트 외관 인테리어의 시그니처 부베트 자전거가 보여요! 야외 테라스 좌석들도 있어서 날씨가 좋으면 야외에 자리 잡아도 좋을 것 같아요! 예약자명을 애기하면 바로 자리를 안내해준다. 생각보다 매장이 넓어서 놀란 부베트.. 전체 인테리어는 레드톤으로 외국에 온것 같은 느낌이 든다. 역시 핫플.. 주말 오후2시에 방문했는데 사람이 많아서 오히려 기다릴정도..2시에 방문해서 받은 메뉴는 오후 4시이후에 방문하면 메뉴가 바뀐다고 합니다. 참고하시고요! 소문대로 가격대는 전체적으로 높은편.. 대부분 테이블에 당근라페를 시켜먹고 있었는데 친구가 추천하지 않아 저는 스킵..! 저는 프렌치 어니언 수프를 시켰는데.. 정말 맛있었어요. 제가 개인적으로 솔티한거를 안좋아한 편인데 달짝 지근한 맛과 치즈 풍미가 강해서 매우 좋았어요! 전체적으로 매장분위기가 굉장히 이색적이고 너무 예뻐서, 한 번쯤은 방문해 보면 좋을 것 같아요 하지만 전체적으로 양 및 메뉴 구성대비 가격대가 높게 형성되어 있는 것 같아서 저는 재방문은 없을것 같습니다.', 'B2', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 39, '[서울숲 핫플카페, 서울앵무새 후기]',  '요즘 성수동에서 제일 유명한 듯 한 시나몬롤 맛집 카페, 서울앵무새를 다녀왔어요. 평일에도 점심시간에는 자리가 없다는 후기를 보고 평일 오픈런을 한 덕분에 창가 자리에서 여유롭게 시나몬롤과 퀸 아망을 즐기고 올 수 있었어요. 12시되니까 정말 붐비더라구요.. ㄷ ㄷ  서울 앵무새는 서울숲보다는 뚝섬역과 가깝지만, 서울숲에서도 10분이면 충분히 걸어갈 수 있는 거리에 있어요. 알록달록한 외관에 크게 서울 앵무새라고 써져있는 건물이에요. 여기 앞이 포토존이라서 사람들이 꽤 많아요. 서울앵무새는 별도의 주차장이 없어서 근처의 성동구 구민 종합체육센터 주차장이나 민영 주차장을 이용해야 해요. 바로 옆면에 서울앵무새의 마스코트도 크게 있는데, 요 아이 옆에서도 앉아서 찍으면 사진이 잘 나올 것 같아요. 지하 1층이 음료와 베이커리를 주문할 수 있어요. 서울앵무새는 시나몬롤과 퀸아망이 유명해요. 늦게가면 보통 품절이라고 하더라구요 퀸아망은 갤러리아 백화점까지 진출했대요! 저는 이중에서 가장 유명한 초코파이 퀸아망과 버터밀크 시나몬롤을 주문했어요. 먹을거말고도 예쁜 굿즈가 많아 구경하기 좋았어요. 아기자기한게 많았지만 지름신은 참았답니다.. 카페임에도 불구하고 포토존과 볼거리가 많아 핫플이라고 인정받은것같아요. 기회되면 꼭 놀러 가보세요!', 'B2', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 14, '더현대 서울 핫플 영탁 팝업스토어 탁스 스튜디오 후기 아니굿즈 왜 이렇게 이뻐!',  '안녕하세요 신이나는 여행중인 여행가 이나에요. 어제 더 현대 서울을 다녀오고 나서 들렀던 팝업스토어 후기들을 정리해서 올리고 있는데요 아니 왜인지 탁스 스튜디오 사진이 가장 많더라구요 ㅎ 사실 굿즈가 너무 이쁘긴했어요 그래서 오늘은 순전히 호기심에 들어갔지만 생각외로 즐기고 나왔던 영탁 팝업스토어 탁스 스튜디오 후기를 남겨볼게요! 사실 다나카 팝업스튜디오를 보려고 지하 1층으로 내려갔는데 파란옷을 입으신 분들이 엄청 많은거에요! 그리고 이렇게 세상 이쁜 탁스 스튜디오가 보이는거 아니겠어요? 사실 첨엔 뭔지 몰랐어요 무슨 굿즈샵 브랜드인줄.. 그런데 옆에보니 영탁님이 엄청 크게 재생되더라구요 이게 생각보다 너무예뻐서 궁금해지더라구요. 막상 들어가보니 대기가 있었던...가차게임이 있었는데 입구에 구매를 많이한사람만 돌릴 수 있었던..전시공안을 볼 수 있었고 굿즈를 구경할수 있었어요. 솔직히 굿즈에 별 관심이 없었는데 굿즈가 이렇게 영하고 귀여울거라고 생각못했습니다. 반성의 계기(?) 스티커뭉치와 펜도 있었어요! 그냥 펜은 아니지만 굿즈치고는 이뻤어요. 가방고리.. 티셔츠.. 우산.. 발매트.. 여러가지 이쁜것들로 잘 구성되어져 있었어요. 영탁님이 입었던 의상도 있었네요.. 폴라로이드 사진을 찍는 공간도 있었는데 돈을 내야했어서 저흰 패스..! 굿즈가 이뻐서 너무 놀라웠고 영탁님이 직접 만든거라고.. 엄청 다재다능하신분! 생각보다 너무 재밌게 구경하고 나왔어요. 그럼 다음후기에 또 다시 찾아올게요 바이바이', 'B2', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 32, '서울 핫플 성수동 에어비앤비 감성숙소 솔직후기',  '이번 서울여행에서 가장 많이 돌아다닌 성수동 핫한 브랜드의 팝업스토어도 많고 서울 핫플 맛집은 모두 여기에 있더라구요? 그래서 숙소로 성수동 근처로 잡아보았다 호텔은 평일인데도 기본11만원 이상 잠만 자는데 좀 아깝다는 생각에 성수동 에어비앤비 감성숙소를 알아보았다. 여기가 내가 1박한 에어비앤비 숙소 딱 요즘 갬성으로 꾸며져 있었다. 평일 기준으로 9만8천원인데 생각보다 싼편은 아니었다. 서울에 도착해서 체크인전까지 마땅히 케리어를 보관할 곳이 없었는데 혹시나 싶어서 호스트에게 체크인 전에 짐을 보관 할 수 있냐고 물었는데 보관해주겠다고 해서 정말 감사했다. 캐리어 놔두러 주소 보고 찾아 가는데 아.. 숙소가가 반지하에 있구나? 9만원 가격대라 당연히 지상일거라고 생각했었지만.. 서울물가 참으로 팍팍하도다! 성수동이라서 그런거겠지..? 간단하게 요리 할 수 있는 도구가 갖춰져 있었다. 방이 조그마한 만큼 딱 2인용으로만 구비 냉장고와 전자레인지, 옷걸이, 슬리퍼가 있고 수건, 바디로션, 바디 스펀지 일회용 칫솔치약, 드라이기, 봉고데기, 마스크 그리고 상비약까지! 참고로 빗이 없어서 당황... 다행히 가져간 캐리어에 꼬리빗이 있어 쓸 수 있었다. 냉장고는 첨 열어보고 엥(?) 했다 보통 생수를 넣어주는데 병에다가 직접 넣어주셨다. 이날 니글니글한 음식을 많이 먹어서 그런지 녹차 1병 꿀떡 다 마셨다. 이제 여기가 침실.. 그린, 옐로우, 화이트의 조합이 꽤 예뻤다. 반지하인데도 쿰쿰한 냄새가 난다거나 춥거나 하지 않았다. 보일러를 미리 틀어 놓으셨던데도 더울 정도.. 그리고 이불 촉감 미쳤다.. 집에 챙겨가고 싶은 촉감.. ㅠㅠ 테이블에는 숙소 주변맛집, 카페, 배달  추천가게까지 정리가 잘된 책자가 있었다. 여기는 tv가 따로 없고 빔프로젝터가 있다. 넷플릭스, 디즈니플러스가 로그인되어 있어서 마음껏 볼 수 있었는데 빔프로젝터 돌아가는 요란한 소리에 거의 보지 못했다 ㅎㅎ 인테리어를 깔끔하게 리모델링을 잘해서 쾌적했다. 필요한 물품들도 다 갖춰져 있었고 춥지도 않았다. 온수도 콸콸 나오고.. 장점은 일단 위치가 너무 좋다 성수동 카페거리 안에 위치한 빌라여서 웬만한 핫플레이스는 다 갈 수 있었다. 단점은 방음이 안되 옆집소리가 그대로 다들렸고 화장실 층고가 낮아 팔을 들 수 없다는것..  잠만 자는 숙소를 원하고 밤늦게까지 성수동에서 술마시고 놀예정이라면 꽤 괜챃다고 생각합니다.(내돈내산)', 'B3', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 39, '[서울핫플/안국빵집/서울줄서는집] 런던 베이글 뮤지엄 안국점 성공후기',  '기본 3시간! 미친 웨이팅! 의지의 한국인 륜륜! 두번의 도전 끝에 천상의 맛 보았노라! 꺄아앙!! 인천공항을 이용할 생각으로 아침에 부산에서 김포공항으로 넘어왔어요 주노가 아침비행기로 서올 오는데 아침식사로 베이글 웨이팅 도전해보겠냐던 런던 베이글 뮤지엄 안국점.. 그래서 그런지 뭐하고 출동! 그 때만해도 몰랐지.. 나는.. 10시에 안국역 내려서 캐리어 끌고 가는데 사람들이 런던베이글 포장해서 지나가고 도착하니 앞에 줄 선 사람이 그리 많지 않길래 에이~ 설만하네 싶었죠.. 그런데...ㅋㅋㅋ 입구의 기기에 대기 등록하는데 ㅋㅋㅋ 지금 10시인데 앞에 353팀이고 최소 3시간 웨이팅.. OTL그자체였던.. 그뒤에 있던사람은 웨이팅 자체도 불가했다. 그만큼 핫플..!  테이크 아웃이 운통 뒤섞여서 북새통 앉아서 먹기가 정신이 없을듯 그래도 스프나 이런메뉴는 앉아야 맛볼 수 있다보니 시장통에 앉아서 먹는것도 도전해볼만함! 진짜 쉬지 않고 직원분들이 일 하심 베이글이 동나면 바로 다시 베이글을 채우고 런던의 산업혁명을 일으킨 장면의 축소판일까.. 카더라 통신에 의하면 국내 여성 ceo의 브랜드라는것 같던데 대다나다 머시따.. 작으마한 크림치즈가 3800원.. 짱 비싸.. 너무너무 신나서 한참을 인증샷 찍었네요.. 다시는 못남길수도 있다고 생각하고 마구마구 촬영! 내가 처음 먹어본 베이글의 식감이었음 질긴 것도 아니고 쫀득하면서 폭신하고 부드러웠다. 왜 사먹는지 알겠다 완전.. 빨리 애들 먹이고 싶다는 생각 한 가득..! 부산에도 빨리 넘어왔으면 좋겠다! 런던 베이글 뮤지엄 진짜 강추드립니다~', 'B2', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 15, '연등회 서울축제/핫플 가볼만한곳',  '지난 주말에 종로거리- 광화문 전체에서 연등회가 진행되었다. 6살 딸아이한테 보여주려고 종로까지 가는 버스를 탔었음..  연등회의 시작은 약 1200여년 전 신라시대때부터 고려시대, 조선의 관등놀이를 거치면서 현대까지 이어져오는 축제라고 해요. 국가 무형문화재와 유네스코 인류무형문화유산으로 등재되어 있기 때문에 초등학생들은 견학소감문 제출해도 가능하죠. 전통적인 모습의 등이나 불을 뿜어내는 용, 귀여운 캐릭터 느낌의 등도 불 수 있었습니다. 로라는 이번에 본 것 중에 불 뿜어내는 용이 가장 기억에 남는다고 하더라구요! 저는 집에서 아이와 저녁먹고 출발해서 8시쯤 도착했는데요. 이미 행렬이 진행중이었고, 사람들도 많이 있었는데 그 후로도 정말 오랜시간 행렬이 이어져왔어요. 제가 알기론 동대문 ddp와 동국대 주변에서 행렬을 시작한다하더라구요. 사람많은 종로거리나 광화문까지 오고싶지 않다.. 중간 중간엔 풍물놀이.. 불교신자가 아닌지라 무슨 스토리를 담았는지는 모르겠지만 눈으로 보면서 아름답다고 느꼈다. 국내뿐만 아니라 외국에서 방문해 구경하는 사람들도 많다는것을 알게되었다. 어린아이들도 모두 각 나라의 전통의상을 입고 예쁘게 꾸민 등을 들고 가는 모습이 인상적이었다. 불교로 유명한 동국대학교 외에 서울에서 내로라하는 대학교.. 아마동아리들끼리 모여 진행했던것 같아요. 서울 가볼만한곳 연등회를 지켜보면서 다양한 등을 구경하는 재미도 있었지만 한복 등의 의복을 보는 맛도 있었답니다. 고전무용할때 입는 것 같은 디자인도 있고, 전통 한복을 입고 참여하신분들도 계셨어요.', 'B2', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 15, '[서울축제/태릉입구 데이트/ 서울핫플] 서울장미 축제 실시간 현황',  '서울에 장미축제가 있었어? 나는 왜 이제안거지.. 5월에만 볼 수 있는 서울 축제 지금 바로 레쯔고우! 지역은 중랑장미공원인데요 지하철로 태릉입구역에 내리서 다리만 건너면 딱! 여기에 도착을 합니다.  해가 뉘엿뉘엿 질때 다녀왔는데 입구쪽에 먹거리 노상은 정리중이었고 저녁에 반짝이는 아이템들 판매하시는 노상은 막 시작하고 계셨어요! 입구쪽에 분위기를 살짝 파악을 해보니까 아주.. 인파가 대단하더라구요~ 다들 인증샷을 남기는데 열심열심... 인증샷도 좋지만 모두들 가시 조심하세요!! 서울 장미축제 어머니부대 엄청나요~ 다들 엄마손 잡고 효도하러 레쯔고! 커플들도 많고 가족단위도 많고! 핸드북도 있으니까 필요하신분은 참고해서 보고 다니는걸 추천! 스팟지역을 도착하니 마치 싱가프ㅗ르 분위기 연상케하는 중랑장미공원!!! 해질녘에 가시는거 추천 하늘에 물드는 모습이 아주 볼 법 하더라구요! 공원에 외국인들도 진짜 많아서 해외여행 온 분위기가 물씬 났습니다. 장미터널을 계속해서 걷습니다. 걷고 걷고 또 걸어요.. 중간에 너무 길다고 짜증내시는 아버님들도 많이 봤어요~! 사실 나도 그랬었던.. 피크닉 분위기 내는 가족단위들도 많았구요.. 여유가 되신다면 돗자리랑 간단한 간식거리 챙겨오세요. 날벌레가 많은게 단점이니 참고하시구욥!', 'B2', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 32, '더 플라자 호텔 서울 오토그래프 컬렉션 디럭스 더블룸 솔직후기',  '서울 시청앞에 위치해있어서 편리했었던 좀 독특한 구조와 내부인테리어가 신기하기도 했다. 이용해봤는데 막상 편리했지만 여전히 독특한 인테리어가 낯설긴 했다. 디럭스룸들어가자마자 체감이 그닥 큰것 같지는 않았다. 욕실도 상당히 좁았던느낌.. 침대가 창문을 그대로 바라본다는 점, 그리고 별도의 책상은 없지만 공간을 잘 활용한 직선의 테이블이 있어서 컴퓨터 작업은 수월했다는 장점은 있었다.. 입구도 많이 좁았다 거울이 문 뒤에 있어서 더 좁아보였다. 침대는 성인2명이 자기엔 충분했던것 같다. 관리가 안된 찢어진 벽지가 있어서 조금 많이 아쉬웠던것 같았다.. 벽지도 정신없는색이라 조금 아쉬웠던것.. 위치적으로는 정말 최고였던 호텔.. 점심 룸서비스가 가능한데 정말 맛있는걸주었다.. 비빔밥과 시저샐러드 내 입맛에 딱 맞아서 마음에 들었다.  ', 'B3', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 32, '여의도 콘래드 호텔 서울 프리미엄 리버뷰 퀸침대 2개 후기 + 조식  ''안녕하세요 오늘은 친구들이랑 여의도 콘래드 호텔에서 호캉스를 보내고 온 후기를 쓸거에요. 성인여자 4명이서 숙박해야 하는터라 방을 2개 잡아야하는 시그니엘은 곤란했고 방하나에 4명이 숙박 가능한 여의도 콘래드 서울로 선택했답니다. 층고가 엄청 높아서 개방감이 장난 아니더라구요 참고로 체크인 시간이 4시부터였어요.! 창문으로 여의도 더 현대뷰.. ㅋㅋㅋㅋ 똑같이 보이더라구요. 고층이라도 뷰가 엄청 좋진 않았을거에요! 넓은 테이블이 있어서 짐놔두거나 뭐 같이 나눠서 먹기 좋았어요! 여자 4명이라 짐이 많을수 밖에 없었던 모먼트.. 호텔들어가자 침대가 너무 푹신해서 드러누워있는 우리들.. ㅎ 다들 I성향인지라 싸우지 않고 침대에 같이 평화롭게 있습니다. 호텔침구가 얼마나 좋았냐면 쉴려고 누웠는데.. 우리도 모르게 잠들었던.. 진짜 폭닥폭닥해서 잠이 잘 안오더라구요! 조식을 먹으러 갔는데 여의도 IFC몰이 잘 보이는곳이었어요. 음식또한 호텔느낌 제대로.. 맛있는것들이 진짜 많더라구요. 저는 아침이라서 입맛이 없어서 가볍게 과일과 켈로그를 먹었습니당 여기는 정말 대만족이에요.. 꼭 한번쯤은 살면서 이렇게 좋은 호텔 오시기를 바래요.. 위치의 장점을 살려 한강이나 경복궁 쇼핑을 못한점이 아쉽네요. ', 'B3', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 32, '[서울 호캉스] 그랜드하얏트 서울 호텔 남산뷰 후기/ 룸컨디션 아이스링크 조식',  '안녕하세요 오늘은 그랜드하얏트 서울 호텔 후기 포스팅을 하려고해요. 아기를 낳은지 1년을 맞이하여 남편이 사촌동생과 호캉스를 다녀오라해서 애낳고 처음으로 외박을 하게 되었어요. 당일 아침까지는 이유식을 만들고.. 저는 서울근교에 있는 호텔은 비교적 최근에 지어진 파라다이스시티나 포시즌스만 가보았는데요. 그랜드 하얏트호텔은 첨와봤어요. 느낌은.. 고풍스럽다? 세월의 흔적이 묻어있다?였어요 방배정은 14층.. 호텔 복도창에서 보이는 뷰에요 남산타워가 엄청 잘 보였어요. 아그리고 연식이 된 호텔이라 엘레베이터가 느릴거라 생각했는데 엄청 빨라서 놀랐어요. 호텔문을 열면 창으로 남산타워가 바로 보여요. 트윈베드룸을 신청했는데 방이 정말 깔끔했어요! 화장실은 세면대 변기 샤워부스가 있었는데 조금 좁았지만 사용하는데 큰 불편함은 없었어요. 화장실 문도 투명인데 옆에 버튼으로 자동 버티칼을 칠 수 있으니 당황마시고 올려주세요! 저흰 그냥 냅두고 사용했어요! 호텔에 아이스링크장도 있어 링크도 이용했습니다. 정말 편의시설이 잘 되어있었어요! 근데 생각보다 크기가 작아서 실망했었던.. 그래도 없는것보다 낫죠 좋은 즐거리 즐겼습니다. 핫초코 쿠폰이 있어서 핫초코를 먹으러갔는데 가격이 무슨 할인받고 13000원.. ㅎㄷㄷ 부자들의 삶 참 쉽지 않은거군요! 이후 야경을 보고 역시 비싼호텔은 다르구나라고 느꼈습니다. 호텔에서 쉬다보니 하루가 빠르게 흘러갔네요 암막커튼도 있어서 잠이 정말 잘왔답니다.', 'B3', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 32, '시그니엘 서울 호텔 한강뷰 후기',  '우리나라 가장 높은 최고급 호텔은 시그니엘! 호텔예약 앱인 여기어때 할인 앱을 통해 예매했어요! 한강뷰+ 전망욕조 추가로 121,000원입니다. 객실에서 욕실까지 통창으로 이어져 있어 한강 뷰를 파노라마로 감상할 수 있어요. 객실에는 침대, 티테이블, 책상, 의자 등이 있어요. 심플하면서도 클래식한 스타일의 가구로 구성됩니다. 조명은 버튼식 스위치로 조절 할 수 있습니다. 시그니엘엔 웰컴티 서비스란게 있는데 따뜻한 차를 마시며 한강뷰하라고 그런것같아요. 객실 어메니티 네스프레소 커피 3종, 에비앙 생수가 제공되었고 주류와 미니바 모두 무료였습니다. 욕실은 세면대 공간과 화장실, 샤워실 공간이 각각분리되어있어요! 불투명 유리문을 열면 화장실이 나옵니다. 전체적인 욕실 인테리어는 고급스러운 대리석 재질로 꾸며졌습니다.  헬스장과 수영장도 따로 구비되어 있더라구요.. ㄸ 방크기는 작았지만 시설도 좋고, 서비스도 좋았던 호텔이었어요. 특히 피트니스 이용이 매우 만족 스러웠습니다. 가격대가 있는 호텔인 만큼 체크인 시간부터 체크아웃 시간까지 꽉꽉 채워 호캉스 즐기고 오세요 :D 시그니엘 특징 우리나라 최고층 호텔, 롯데월드타워와 연결, 수영장, 피트니스 무료이용, 투숙개 전용라운지 무료 입장, 객실크기는 좁은편, 추가요금 내고 한강뷰 객실 추천 이정도가 있겠네요', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 32, '홍대 게스트하우스 후기 <코코아 게스트하우스>',  '얼마전에 서울에 다녀왔어요! 홍대쪽으로 덕질때문에 가게되어서 좀 이른시간부터 움직일 계획이므로 숙박을 잡아야겠더라구요! 그래서 모텔을 갈까 하다가 게하를 갔는데요! 미리 블로그랑 후기로 많이 찾아봐서 익숙하네요 호스트분이 미리 사진으로 약도를 보내준데요 업데이트가 필요해보였어요! 저는 4인실을 선택 한 이유가 혼자 자려니까 약간 무서워서 전에도 덕질 때문에 서울 가면 모텔에서 자보고 좀 무서워서 찜질방에서 다같이 자는데서 자고 그랬거든요.. 아무도 안왔어요 혼자잤어요 ㅠㅠ 침대위에서 취식 또는 화장을 하지말것..  수건 하나만 줬는데 너무 아쉬웠어요.. 홍대라서 그런지 새벽까지 굉장히 시끄럽다는 후기가 있었는데 제가 갔을때는 엄청 조용했어요. 그래서 한마디로 꿀잠 잤다는 말씀! ㅎㅎ ㅋㅋ 이정도면 서울 한달살기 하려고 했었는데 해봐도 괜찮을것같아요 1박에 17,000원 조금 넘는 가격이었어요. 다음에는 1박 예약할때 돈을 조금 더 주고 모텔가는것도 괜찮은 방법인것 같았어요!  ', 'B3', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 14, '[서울 가볼만한 곳]어느 수집가의 초대 국립중앙 박물관 전시',  '어느 수집가의 초대 서울 국립중앙박물관을 갔다왔다. 계단을 올라왔더니 남산타워가 잘 보인다. 이쪽으로도 분위기 좋아서 사진 찍기 좋은 것 같은데 날씨가 안 좋아서 아깝다. 티켓을 받았습니다. 1주년 기념전이라고 합니다. 입장 시간이 정해져 있어서 그 시간대에 맞게 입장이 이루어진다. 대신 관람 시간에 제한은 없었다. 사진 촬영은 되지만 플래시, 보조광은 사용 불가! 어플을 다운받으면 설명도 들을 수 있다. 전시 처음에는 들었는데 사람들이 많아서 뒤에는 포기했다. 설명 다 들을 때까지 작품 바라보기 좀 힘듦. 티켓 사진 한 번 더 찍고 들어가 봅시다! 사실 한 명이 모은 것이 이렇게 많다는 것이 놀라웠다. 그리고 내가 흔하게 생각했던 수집품에서 더 많은 범위가 모아진 것도 신기했다. 그리고 전시회 자체를 내가 생각하기 시작할 때 간 이후로는 거의 처음이라 어떻게 전시회가 구성되었는지에 집중해서 본 것 같았다. 클로드 모네의 수련도 있고 이중섭의 황소도 있다는 것이 놀라웠다. 제일 인상 깊었던 박대성 작가의 불국설경 눈이 온 불국사 풍경을 모든 곳에서 바라보는 시점으로 그렸다. 그리고 이거를 어두운 방 안에 딱 이거 하나 있는데 눈에 계속 담고 싶었다. 글이 쓰여있어서 읽어보다가 옆에 해석본 있어서 잘 이해했다. 이렇게 많은 것을 모았다니 그냥 무언가를 넘어서 단순하게 수집을 이렇게 할 수 있다는 것에 경의로움을 느꼈다. 본 김에 따라 하기.... 기간에만 전시하는 것도 있어서 더 주의 깊게 보고 오기! 근데 제일 보고 싶었던 인왕제색도는 어긋나서 못 봤다. 종소리도 들리고 작품도 보고 맨 마지막에는 백남준의 작품이 있었다. 예매하기 빡세지만 그래도 와보니까 좋았던 어느 수집가의 초대 송현동에 전시관이 생긴다던데 2024년 12월에 착공 예정이라 생길 때까지 한참 남았다. 다른 전시로 계속 볼 수 있다면 또 한 번 찾아가야지. ', 'B2', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 39, '한남동 맛집 한남동 자리 :: 목화솜탕수육과 철판어향 새우가지는 필수',  '우연히 줄 서서 먹게 된 한남동 자리! 웨이팅은 명단에 기재해야 한다. 그냥 줄 서는 줄 알고 서있다가 뒤 사람이 먼저 들어가서 상심했다. 음식 메뉴는 이렇게 되어있다. 보자마자 철판어향새우가지는 꼭 먹자고 하고 추가로 봤는데 탕수육도 먹고 싶고 짬뽕도 먹고 싶은데 어떡하지 하다가 다 시켜준 창원이 짱이야.....밑반찬은 단무지와 짜사이로 심플 그 자체 수요미식회에도 나온 시그니처 목화솜탕수육이 먼저 나왔다. 소스는 부먹이 아닌 찍먹이다. 동글동글하게 목화솜 같은 비주얼이 특징인 목화솜탕수육은 찹쌀로 동글동글하게 튀겨져 있는 형태이다. 2인 테이블로 안내되었는데 테이블 조금 많이 좁아서 슬펐다. 근데 또 어떻게 놓다 보니까 놓아지는 이 매직⭐ 입안에서 바삭바삭하게 부서지는 것이 아주 좋았던 탕수육이다. 잡내도 없어서 최애 탕수육이 될 듯! 소스 위에는 파인애플이랑 양파랑 호박인 것 같은데 파인애플만 건져서 먹었다. 안에 이렇게 튀겨져 있어서 바삭하면서도 쫄깃했던 목화솜탕수육 가면 또 주문해서 먹을 것 같다>< 모두의 시선을 사로잡았던 철판 어향 새우 가지! 이 소스가 뿌려질 때의 소리는 꼭 들어보시라고 소리도 살렸다. 덕분에 모두의 이목이 집중됨 가지 사이에 다진 새우가 들어가고 아래에는 숙주가 깔려있어서  소스와 뜨거운 철판이 만날 때의 열에 의해서 익는다. 가지 안 좋아하는데 비싼 음식에 들어간 가지는 좋아함 그리고 이거는 진짜 맛있었다. 밑에 깔린 숙주와 조합이 상당하고 목화솜탕수육을 튀긴 그 튀김 같아서 바삭하면서도 쫀득함이 살아있고 나중에 소스가 스며들어도 바삭하다. 참고로 진짜 뜨거워서 반 갈라 먹었다. 안에 새우가 이렇게 탱글하게 들어감. 이거 주문 안 하는 테이블이 있던데 주문 안 하면 후회하는 거예요... ᅲᅲ 짬뽕은 튀김이 두 가지나 되기 때문에 없으면 느끼할 것 같아서 주문했다. 근데 불 맛인 건지 탄 맛인 건지 그 경계가 모호해서 그냥 그랬다. 솔직히 앞의 두 요리가 너무 맛있어서 짬뽕이 묻힌 감이 없지 않아 있다. 그리고 면이 굉장히 독특했다. 쌀국수 면같이 직사각형이었던 면 짬뽕은 같이 곁들이기 좋은 메뉴였다.', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 39, '[서울가볼만한곳/핫플]한남동 카페 narrow path',  '빨간네온사인이 보이는곳 네로우 패스! 2층과 3층 둘다 운영하는 카페! 2층이 꽉차 있어서 3층으로 올라갔다. 가격대는 뭐 한남동 알다시피 비싸니 비싸다.. 그래도 맛있어보이는건 잔뜩(?)! 밀크티와 얼그레이바스크 치즈케이크를 주문했다. 치즈케이크가 엄청 거대하다.. 소스가 많아서 느끼할것같지만 정말 맛있었던 평가..! 네로우 패스 너 정말 좋은데구나(?) 공간도 엄청 넓었다 한남동하면 꼭 와봐야하는 네로우 패스 회사사람들이 추천해줘서 갔는데.. 뭐 유명하다보기보단 달다구리한게 내입맛을 사로잡은 느낌이랄까 다음에 친구들이랑 한번 또 와봐야겠다.', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 39, '하남돼지 강남점 여긴 다르다!!',  '친구들이랑 고기를 먹고싶어서 강남에서 만난 후 하남돼지 고기집을 갔다. 1시간 정도 웨이팅하고 이제 돼지고기 뜯을 타임.. 우리가 구울줄 알았는데 이쪽에서 알아서 구워준다. 냄새가 솔솔 나를 지배한다.. 파 절임, 소금, 쌈장, 쌈 채소 등등 다양하게 앞에 세팅되었다.처음은 본삼겹으로 시작해 봅시다. 이렇게 세팅되어서 나온다.본삼겹 뿐만 아니라 철판을 닦을 기름과 파, 마늘, 버섯이 함께 나온다. 불판이 달구어질 때까지 기다렸다가 와서 구워주시니까 기다리면 된다불판을 이걸로 먼저 기름칠한다. 구워주는 것은 다 좋았는데 다만 조금 구워주다가 다른 테이블도 봐야 하기 때문에 사라지셨다. 그러다 보니 눈앞에서 고기가 타는데 먹어도 된다고 해서 의아.. 그리고 삼겹살엔 역시.. 소주지 처음처럼 탛! 한병을 깠다  크 고기에 술도 잘들어가니 오늘밤은 잠자리 폈다 하면서 있었다. 맛집이기도 하지만 기분이 좋았던 하루.. 다음에도 친구들이랑 고기땡기면 이쪽을 와야겠다 존맛탱 인정!', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(0, 1, 39, '[서울 논현맛집]성시경의 먹을텐데 나온 영동 장어 룸식당!!!',  '저번주 주말에 친구들과 영동장어 집에 다녀왔습니다. 대학교 동기 계모임이라 돈을 모으고 있습니다. 그래서 항상 비싼 식당가는데 이번에는 장어먹으러 갔습니다. 친구중 한명이 성시경의 먹을텐데 완전팬이라서 여기 가보고 싶다고 하길래 잊고 있던 먹을텐데 맛집을 가보게 되었네요. 사실 같은 값이면 소고기를 선호하는 편이라서.. 아무튼 후기 스따또 합니다! 강남구청역에서 킥보드 타고 갔어요. 걸어가면 한 15분정도 걸리는것같아요!  외관은 살짝 올드한느낌? 클래식한 분위기가 있는 식당입니다. 수족관에 일용할 장어들을 보며 이넘들 맛있게 생겼구나~  메뉴에는 장어말고도 갯벌부터 민불 독도새우등 많이 있었습니다. 생각보다 나오니까 귀엽게 생겼던.. 이걸 먹어야하나..? 하지만 생각도 잠시 인생이 뭐 다그런거죠 맛있는거 앞에 물불도 안가리는..쓸개간 즙 다 바려내주셨습니다. 살아있는녀석을 굽다보니 시간이 제법 걸렸습니다. 다익고 소금에 찍먹하라해서 먹어봤는데 역시 장어는 남자들한테 좋은것이야~! 힘이 불끈 나는느낌이랄까? 사실 잘모르겠는데 맛은 있었던것 같습니다. 2년만의 먹는 장어라 그런가..? 쓸개즙으로 장어주타주는데 오 이건 또 신선하더군요 먹어봤는데 맛차이는 그닥.. 비릿하기만 했었던것 같습니다. 암튼 유명한곳이기도 하고 맛은 제법 있었습니다. 살도 오동통통하구 비린내또한 없었어요 다른데서는 비린내가 많이나서 잘 먹질 못했었는데 건강한맛 뿜뿜..! 다먹고 부족해서 민물장어도 시켰어요! 갯벌장어보다 살이 덜하지만 장어는 맛있는것이여~ 총 4명에서 42만원 나왔지만 후회없이 먹고 나왔던것 같습니다. 가성비 원하시면 여기 비추! 그러나 맛을 위해 온다면 여기 추천합니다..! ', 'B1', '원본파일명.txt', '변경된파일명.txt', DEFAULT, 'Y', DEFAULT, DEFAULT);


COMMIT;
SELECT * FROM BOARD;

------------------------------------------------------------------
------------------------- REPLY 관련 테이블 -------------------------
------------------------------------------------------------------

use tourapi;
drop table reply;
CREATE TABLE REPLY(
  rNO INT PRIMARY KEY AUTO_INCREMENT,
  bNO INT, -- contentid 
  mNO INT,
  CONTENT VARCHAR(1000),
  STATUS VARCHAR(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
  CREATE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
  MODIFY_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (bNO) REFERENCES BOARD(bNO),
  FOREIGN KEY (mNO) REFERENCES MEMBER(mNO)
);



INSERT INTO REPLY VALUES(0, 1, 1, '안녕하세요.', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO REPLY VALUES(0, 1, 1, '반갑습니다.', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO REPLY VALUES(0, 2, 1, '안녕하세요.', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO REPLY VALUES(0, 2, 1, '반갑습니다.', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO REPLY VALUES(0, 3, 1, '안녕하세요.', DEFAULT, DEFAULT, DEFAULT);
INSERT INTO REPLY VALUES(0, 3, 1, '반갑습니다.', DEFAULT, DEFAULT, DEFAULT);


COMMIT;

SELECT * FROM REPLY;
 
 
CREATE TABLE Accommodation(
	contentid      	INT,
	contenttypeid      VARCHAR(100),
	homepage           VARCHAR(1000),
	tel                VARCHAR(100),
	title              VARCHAR(200),
	firstimage         VARCHAR(200),
	firstimage2        VARCHAR(200),
	areacode           VARCHAR(100),
	sigungucode        VARCHAR(100),
	cat1               VARCHAR(100),
	cat2               VARCHAR(100),
	cat3               VARCHAR(100),
	addr1              VARCHAR(100),
	addr2              VARCHAR(100),
    zipcode      		VARCHAR(100),
	mapx               VARCHAR(100),
	mapy               VARCHAR(100),
	overview           VARCHAR(3000),
	mlevel             VARCHAR(100),
	accomcountlodging   VARCHAR(100),
	benikia             VARCHAR(100),
	checkintime         VARCHAR(100),
	checkouttime        VARCHAR(100),
	chkcooking          VARCHAR(100),
	foodplace           VARCHAR(1000),
	goodstay            VARCHAR(100),
	hanok               VARCHAR(100),
	infocenterlodging   VARCHAR(100),
	parkinglodging      VARCHAR(100),
	pickup              VARCHAR(100),
	roomcount           VARCHAR(100),
	reservationlodging  VARCHAR(100),
	reservationurl      VARCHAR(100),
	roomtype            VARCHAR(1000),
	scalelodging        VARCHAR(100),
	subfacility         VARCHAR(1000),
	barbecue            VARCHAR(100),
	beauty              VARCHAR(100),
	beverage            VARCHAR(100),
	bicycle             VARCHAR(100),
	campfire            VARCHAR(100),
	fitness             VARCHAR(100),
	karaoke             VARCHAR(100),
	publicbath          VARCHAR(100),
	publicpc            VARCHAR(100),
	sauna               VARCHAR(100),
	seminar             VARCHAR(100),
	sports              VARCHAR(100),
	refundregulation    VARCHAR(1000),
	PRIMARY KEY (contentid)
);
-- DROP TABLE Accommodation;
DESC Accommodation;
select * from Accommodation;


 CREATE TABLE Tourlist(
	contentid      	INT,
	contenttypeid      VARCHAR(100),
	homepage           VARCHAR(600),
	tel                VARCHAR(100),
	title              VARCHAR(200),
	firstimage         VARCHAR(200),
	firstimage2        VARCHAR(200),
	areacode           VARCHAR(100),
	sigungucode        VARCHAR(100),
	cat1               VARCHAR(100),
	cat2               VARCHAR(100),
	cat3               VARCHAR(100),
	addr1              VARCHAR(100),
	addr2              VARCHAR(100),
    zipcode      		VARCHAR(100),
	mapx               VARCHAR(100),
	mapy               VARCHAR(100),
	overview           VARCHAR(3000),
	mlevel             VARCHAR(100),
	accomcount   		VARCHAR(100),
	chkbabycarriage     VARCHAR(100),
	chkcreditcard       VARCHAR(100),
	chkpet        		VARCHAR(100),
	expagerange         VARCHAR(100),
	expguide           	VARCHAR(1000),
	heritage1           VARCHAR(100),
	heritage2           VARCHAR(100),
	heritage3   		VARCHAR(100),
	infocenter      	VARCHAR(1000),
	opendate            VARCHAR(100),
	parking           	VARCHAR(500),
	restdate  			VARCHAR(100),
	useseason      		VARCHAR(100),
	usetime            	VARCHAR(1000),
	PRIMARY KEY (contentid)
);
-- DROP TABLE Tourlist;
DESC Tourlist;
select * from Tourlist;
 
 
 CREATE TABLE CultureContent(
	contentid      	INT,
	contenttypeid      VARCHAR(100),
	homepage           VARCHAR(300),
	tel                VARCHAR(100),
	title              VARCHAR(200),
	firstimage         VARCHAR(200),
	firstimage2        VARCHAR(200),
	areacode           VARCHAR(100),
	sigungucode        VARCHAR(100),
	cat1               VARCHAR(100),
	cat2               VARCHAR(100),
	cat3               VARCHAR(100),
	addr1              VARCHAR(100),
	addr2              VARCHAR(100),
    zipcode      		VARCHAR(100),
	mapx               VARCHAR(100),
	mapy               VARCHAR(100),
	overview           VARCHAR(2500),
	mlevel             VARCHAR(100),
    imgname				VARCHAR(100),
    originimgurl		VARCHAR(1000),
    smallimageurl		VARCHAR(1000),
	accomcountculture   		VARCHAR(100),
	chkbabycarriageculture     	VARCHAR(100),
	chkcreditcardculture       	VARCHAR(100),
	chkpetculture        		VARCHAR(100),
	discountinfo         		VARCHAR(1000),
	infocenterculture          	VARCHAR(1000),
	parkingculture           	VARCHAR(1000),
	parkingfee         			VARCHAR(500),
	usefee   					VARCHAR(1000),
	usetimeculture      		VARCHAR(1000),
    restdateculture				VARCHAR(1000),
	scale            			VARCHAR(1000),
	spendtime           		VARCHAR(1000),
	PRIMARY KEY (contentid)
);
-- DROP TABLE CultureContent;
DESC CultureContent;
select * from CultureContent;

CREATE TABLE Food(
	contentid      		INT,
	contenttypeid      	VARCHAR(100),
	homepage          	VARCHAR(500),
	tel                	VARCHAR(100),
	title              	VARCHAR(200),
	firstimage         	VARCHAR(200),
	firstimage2        	VARCHAR(200),
	areacode           	VARCHAR(100),
	sigungucode        	VARCHAR(100),
	cat1               	VARCHAR(100),
	cat2               	VARCHAR(100),
	cat3               	VARCHAR(100),
	addr1              	VARCHAR(100),
	addr2              	VARCHAR(100),
    zipcode      		VARCHAR(100),
	mapx               	VARCHAR(100),
	mapy               	VARCHAR(100),
	overview           	VARCHAR(2000),
	mlevel             	VARCHAR(100),
    chkcreditcardfood 	VARCHAR(500),
	discountinfofood	VARCHAR(500),
	firstmenu			VARCHAR(2000),
	infocenterfood		VARCHAR(500),
	kidsfacility		VARCHAR(500),
	opendatefood		VARCHAR(500),
	opentimefood		VARCHAR(500),
	packing				VARCHAR(500),
	parkingfood			VARCHAR(500),
	reservationfood		VARCHAR(500),
	restdatefood		VARCHAR(500),
	scalefood			VARCHAR(500),
	seat				VARCHAR(500),
	smoking				VARCHAR(500),
	treatmenu			VARCHAR(1000),
	lcnsno				VARCHAR(500),
    PRIMARY KEY (contentid)
);
-- DROP TABLE food;
desc food;
select * from food;


CREATE TABLE Festival(
	contentid      		INT,
	contenttypeid      	VARCHAR(100),
	homepage          	VARCHAR(800),
	tel                	VARCHAR(200),
	title              	VARCHAR(200),
	firstimage         	VARCHAR(200),
	firstimage2        	VARCHAR(200),
	areacode           	VARCHAR(100),
	sigungucode        	VARCHAR(100),
	cat1               	VARCHAR(100),
	cat2               	VARCHAR(100),
	cat3               	VARCHAR(100),
	addr1              	VARCHAR(100),
	addr2              	VARCHAR(100),
    zipcode      		VARCHAR(100),
	mapx               	VARCHAR(100),
	mapy               	VARCHAR(100),
	overview           	VARCHAR(2000),
	mlevel             	VARCHAR(100),
	agelimit			VARCHAR(100),
	bookingplace		VARCHAR(300),
	discountinfofestival	VARCHAR(100),
	eventenddate		VARCHAR(100),
	eventhomepage		VARCHAR(300),
	eventplace			VARCHAR(300),
	eventstartdate		VARCHAR(100),
	festivalgrade		VARCHAR(100),
	placeinfo			VARCHAR(500),
	playtime			VARCHAR(300),
	program				VARCHAR(100),
	spendtimefestival	VARCHAR(100),
	sponsor1			VARCHAR(100),
	sponsor1tel			VARCHAR(200),
	sponsor2			VARCHAR(100),
	sponsor2tel			VARCHAR(100),
	subevent			VARCHAR(300),
	usetimefestival		VARCHAR(300),
    imgname				VARCHAR(1000),
	originimgurl 		VARCHAR(1000),
	smallimageurl		VARCHAR(1000),
    PRIMARY KEY (contentid) 
);
-- DROP TABLE Festival;
desc festival;
select * from Festival;

CREATE TABLE TourImage(
iNo	INT PRIMARY KEY AUTO_INCREMENT,
contentid	INT,
imgname	VARCHAR(1000),
originimgurl VARCHAR(1000),
smallimageurl	VARCHAR(1000)
);
DESC TourImage;
SELECT * FROM TourImage;

use tourapi;
drop table foodreply;
CREATE TABLE FOODREPLY(
  rNO INT PRIMARY KEY AUTO_INCREMENT,
  contentid INT,
  contenttypeid int,
  mNO INT,
  CONTENT VARCHAR(1000),
  STATUS VARCHAR(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
  CREATE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
  MODIFY_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (mNO) REFERENCES MEMBER(mNO)
);
select * from foodreply;

-- SELECT contentid FROM Festival;


-- SELECT * FROM Festival WHERE eventstartdate >= DATE_FORMAT(NOW(), '%Y%m01') ORDER BY eventstartdate;

-- select title, eventstartdate, eventenddate, firstimage
-- from tourapi.festival
-- where date_format(now(), '%Y%m%d') between  eventstartdate and eventenddate
-- order by eventstartdate;
