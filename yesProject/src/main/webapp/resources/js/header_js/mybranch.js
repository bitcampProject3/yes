    // 로그인시 내 매장 정보를 눌렀을때의 modal
	function myBranch() {
    	console.log('myBranch...');
		var myBranchDetail = [];
    	$.ajax({
            type: "POST",
            url:"./branchInfo",
			dataType:"json",
            success:function(data){
				console.log(data[0]);
				var id              = data[0].id,
					branchName      = data[0].branchName,
					opTime          = data[0].opTime,
					breakTime       = data[0].breakTime,
					opDate          = data[0].opDate,
					phoneNum        = data[0].phoneNum,
					score           = data[0].score,
					state           = data[0].state,
					zoneCode        = data[0].zoneCode,
					roadAddress     = data[0].roadAddress,
					jibunAddress    = data[0].jibunAddress,
					detailAddress   = data[0].detailAddress,
					markerImage     = data[0].markerImage,
					mainImage       = data[0].mainImage,
					image1          = data[0].image1,
					image2          = data[0].image2,
					image3          = data[0].image3,
					image4          = data[0].image4,
					image5          = data[0].image5,
					image6          = data[0].image6,
					image7          = data[0].image7,
					image8          = data[0].image8,
					category        = data[0].category,
					branchExplain   = data[0].branchExplain,
					sido            = data[0].sido,
					sigungu         = data[0].sigungu,
					category        = data[0].category;

				// 매장 detail 페이지에 db정보 추가
				$('.detailModalTopTitle').empty().append(branchName);
				$('.modalScore').empty().append('평점 : '+score+' / 5.0');
				$('.modalAddress').empty().append(roadAddress);
				$('.modalJibunAddress').empty().append('(우) '+zoneCode+' (지번) '+jibunAddress);
				$('.modalPhoneNum').empty().append(phoneNum);
				$('.modalOpTime').empty().append(opTime);
				$('.modalBreakTime').empty().append(breakTime);
				$('.modalOpDay').empty().append(opDate);
				$('.modalExplain').empty().append(branchExplain);
				$('.categorySpan').empty().append(sido+' '+sigungu);
				$('.modalStatus').css('display','none');


				$('.gallerymain').attr('src',imagePath+image1);
				$('.gallerylink').attr('href',imagePath+image1);

				for (i = 1; i<9; i++){
					$('.img'+[i]).attr('src',imagePath+(image1.substring(0,12))+i+'.jpg');
					$('.imgLink'+[i]).attr('href',imagePath+(image1.substring(0,12))+i+'.jpg');
				}

            },
			error: function(request,status,error) {
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });

    	var menuArr = [];

    	$.ajax({
	        type: 'POST',
	        url: './mybranchdetail',
	        dataType: 'json',
	        success: function (data) {
	        	console.log(data);
		        $.each(data,  function (idx, val) {
		        	console.log(val);
			        menuArr.push(val.menu);
			        menuArr.push(val.price);
		        });
		        for (i = 0; i <menuArr.length; i++){
					$('.modalMenuName'+[i]).empty().append(menuArr[i*2]);
					$('.modalMenuPrice'+[i]).empty().append(menuArr[i*2+1]);
				}
	        },
			error: function(request,status,error) {
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });


	}