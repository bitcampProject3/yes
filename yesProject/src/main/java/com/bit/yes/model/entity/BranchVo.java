package com.bit.yes.model.entity;

import java.util.Map;
import java.util.Objects;

public class BranchVo {
    private String id;
    private String branchName;
    private String opTime;
    private String breakTime;
    private String opDate;
    private String phoneNum;
    private int score;
    private String state;
    private String zoneCode; //여기서 카테고리가 뭔지?
    private String roadAddress;
    private String jibunAddress;
    private String detailAddress;
    private String markerImage;
    private String mainImage;
    private String image1;
    private String image2;
    private String image3;
    private String image4;
    private String image5;
    private String menu;
    private String price;
    private String mainMenu;
    private Map<String, Object> searchResult;
    private String searchRocate;
    private String searchInput;
    private String latlngy;
    private String latlngx;
    
    private int maxTable;
    private int tableState;
    private String acceptState;
    private int waitingNum; //현재 입장 번호

    
    public BranchVo() {
    }


	public BranchVo(String id, String branchName, String opTime, String breakTime, String opDate, String phoneNum,
			int score, String state, String zoneCode, String roadAddress, String jibunAddress, String detailAddress,
			String markerImage, String mainImage, String image1, String image2, String image3, String image4,
			String image5, String menu, String price, String mainMenu, Map<String, Object> searchResult,
			String searchRocate, String searchInput, String latlngy, String latlngx, int maxTable, int tableState,
			String acceptState, int waitingNum) {
		super();
		this.id = id;
		this.branchName = branchName;
		this.opTime = opTime;
		this.breakTime = breakTime;
		this.opDate = opDate;
		this.phoneNum = phoneNum;
		this.score = score;
		this.state = state;
		this.zoneCode = zoneCode;
		this.roadAddress = roadAddress;
		this.jibunAddress = jibunAddress;
		this.detailAddress = detailAddress;
		this.markerImage = markerImage;
		this.mainImage = mainImage;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.image4 = image4;
		this.image5 = image5;
		this.menu = menu;
		this.price = price;
		this.mainMenu = mainMenu;
		this.searchResult = searchResult;
		this.searchRocate = searchRocate;
		this.searchInput = searchInput;
		this.latlngy = latlngy;
		this.latlngx = latlngx;
		this.maxTable = maxTable;
		this.tableState = tableState;
		this.acceptState = acceptState;
		this.waitingNum = waitingNum;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getBranchName() {
		return branchName;
	}


	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}


	public String getOpTime() {
		return opTime;
	}


	public void setOpTime(String opTime) {
		this.opTime = opTime;
	}


	public String getBreakTime() {
		return breakTime;
	}


	public void setBreakTime(String breakTime) {
		this.breakTime = breakTime;
	}


	public String getOpDate() {
		return opDate;
	}


	public void setOpDate(String opDate) {
		this.opDate = opDate;
	}


	public String getPhoneNum() {
		return phoneNum;
	}


	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}


	public int getScore() {
		return score;
	}


	public void setScore(int score) {
		this.score = score;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getZoneCode() {
		return zoneCode;
	}


	public void setZoneCode(String zoneCode) {
		this.zoneCode = zoneCode;
	}


	public String getRoadAddress() {
		return roadAddress;
	}


	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}


	public String getJibunAddress() {
		return jibunAddress;
	}


	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}


	public String getDetailAddress() {
		return detailAddress;
	}


	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}


	public String getMarkerImage() {
		return markerImage;
	}


	public void setMarkerImage(String markerImage) {
		this.markerImage = markerImage;
	}


	public String getMainImage() {
		return mainImage;
	}


	public void setMainImage(String mainImage) {
		this.mainImage = mainImage;
	}


	public String getImage1() {
		return image1;
	}


	public void setImage1(String image1) {
		this.image1 = image1;
	}


	public String getImage2() {
		return image2;
	}


	public void setImage2(String image2) {
		this.image2 = image2;
	}


	public String getImage3() {
		return image3;
	}


	public void setImage3(String image3) {
		this.image3 = image3;
	}


	public String getImage4() {
		return image4;
	}


	public void setImage4(String image4) {
		this.image4 = image4;
	}


	public String getImage5() {
		return image5;
	}


	public void setImage5(String image5) {
		this.image5 = image5;
	}


	public String getMenu() {
		return menu;
	}


	public void setMenu(String menu) {
		this.menu = menu;
	}


	public String getPrice() {
		return price;
	}


	public void setPrice(String price) {
		this.price = price;
	}


	public String getMainMenu() {
		return mainMenu;
	}


	public void setMainMenu(String mainMenu) {
		this.mainMenu = mainMenu;
	}


	public Map<String, Object> getSearchResult() {
		return searchResult;
	}


	public void setSearchResult(Map<String, Object> searchResult) {
		this.searchResult = searchResult;
	}


	public String getSearchRocate() {
		return searchRocate;
	}


	public void setSearchRocate(String searchRocate) {
		this.searchRocate = searchRocate;
	}


	public String getSearchInput() {
		return searchInput;
	}


	public void setSearchInput(String searchInput) {
		this.searchInput = searchInput;
	}


	public String getLatlngy() {
		return latlngy;
	}


	public void setLatlngy(String latlngy) {
		this.latlngy = latlngy;
	}


	public String getLatlngx() {
		return latlngx;
	}


	public void setLatlngx(String latlngx) {
		this.latlngx = latlngx;
	}


	public int getMaxTable() {
		return maxTable;
	}


	public void setMaxTable(int maxTable) {
		this.maxTable = maxTable;
	}


	public int getTableState() {
		return tableState;
	}


	public void setTableState(int tableState) {
		this.tableState = tableState;
	}


	public String getAcceptState() {
		return acceptState;
	}


	public void setAcceptState(String acceptState) {
		this.acceptState = acceptState;
	}


	public int getWaitingNum() {
		return waitingNum;
	}


	public void setWaitingNum(int waitingNum) {
		this.waitingNum = waitingNum;
	}


	@Override
	public String toString() {
		return "BranchVo [id=" + id + ", branchName=" + branchName + ", opTime=" + opTime + ", breakTime=" + breakTime
				+ ", opDate=" + opDate + ", phoneNum=" + phoneNum + ", score=" + score + ", state=" + state
				+ ", zoneCode=" + zoneCode + ", roadAddress=" + roadAddress + ", jibunAddress=" + jibunAddress
				+ ", detailAddress=" + detailAddress + ", markerImage=" + markerImage + ", mainImage=" + mainImage
				+ ", image1=" + image1 + ", image2=" + image2 + ", image3=" + image3 + ", image4=" + image4
				+ ", image5=" + image5 + ", menu=" + menu + ", price=" + price + ", mainMenu=" + mainMenu
				+ ", searchResult=" + searchResult + ", searchRocate=" + searchRocate + ", searchInput=" + searchInput
				+ ", latlngy=" + latlngy + ", latlngx=" + latlngx + ", maxTable=" + maxTable + ", tableState="
				+ tableState + ", acceptState=" + acceptState + ", waitingNum=" + waitingNum + "]";
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((acceptState == null) ? 0 : acceptState.hashCode());
		result = prime * result + ((branchName == null) ? 0 : branchName.hashCode());
		result = prime * result + ((breakTime == null) ? 0 : breakTime.hashCode());
		result = prime * result + ((detailAddress == null) ? 0 : detailAddress.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((image1 == null) ? 0 : image1.hashCode());
		result = prime * result + ((image2 == null) ? 0 : image2.hashCode());
		result = prime * result + ((image3 == null) ? 0 : image3.hashCode());
		result = prime * result + ((image4 == null) ? 0 : image4.hashCode());
		result = prime * result + ((image5 == null) ? 0 : image5.hashCode());
		result = prime * result + ((jibunAddress == null) ? 0 : jibunAddress.hashCode());
		result = prime * result + ((latlngx == null) ? 0 : latlngx.hashCode());
		result = prime * result + ((latlngy == null) ? 0 : latlngy.hashCode());
		result = prime * result + ((mainImage == null) ? 0 : mainImage.hashCode());
		result = prime * result + ((mainMenu == null) ? 0 : mainMenu.hashCode());
		result = prime * result + ((markerImage == null) ? 0 : markerImage.hashCode());
		result = prime * result + maxTable;
		result = prime * result + ((menu == null) ? 0 : menu.hashCode());
		result = prime * result + ((opDate == null) ? 0 : opDate.hashCode());
		result = prime * result + ((opTime == null) ? 0 : opTime.hashCode());
		result = prime * result + ((phoneNum == null) ? 0 : phoneNum.hashCode());
		result = prime * result + ((price == null) ? 0 : price.hashCode());
		result = prime * result + ((roadAddress == null) ? 0 : roadAddress.hashCode());
		result = prime * result + score;
		result = prime * result + ((searchInput == null) ? 0 : searchInput.hashCode());
		result = prime * result + ((searchResult == null) ? 0 : searchResult.hashCode());
		result = prime * result + ((searchRocate == null) ? 0 : searchRocate.hashCode());
		result = prime * result + ((state == null) ? 0 : state.hashCode());
		result = prime * result + tableState;
		result = prime * result + waitingNum;
		result = prime * result + ((zoneCode == null) ? 0 : zoneCode.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BranchVo other = (BranchVo) obj;
		if (acceptState == null) {
			if (other.acceptState != null)
				return false;
		} else if (!acceptState.equals(other.acceptState))
			return false;
		if (branchName == null) {
			if (other.branchName != null)
				return false;
		} else if (!branchName.equals(other.branchName))
			return false;
		if (breakTime == null) {
			if (other.breakTime != null)
				return false;
		} else if (!breakTime.equals(other.breakTime))
			return false;
		if (detailAddress == null) {
			if (other.detailAddress != null)
				return false;
		} else if (!detailAddress.equals(other.detailAddress))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (image1 == null) {
			if (other.image1 != null)
				return false;
		} else if (!image1.equals(other.image1))
			return false;
		if (image2 == null) {
			if (other.image2 != null)
				return false;
		} else if (!image2.equals(other.image2))
			return false;
		if (image3 == null) {
			if (other.image3 != null)
				return false;
		} else if (!image3.equals(other.image3))
			return false;
		if (image4 == null) {
			if (other.image4 != null)
				return false;
		} else if (!image4.equals(other.image4))
			return false;
		if (image5 == null) {
			if (other.image5 != null)
				return false;
		} else if (!image5.equals(other.image5))
			return false;
		if (jibunAddress == null) {
			if (other.jibunAddress != null)
				return false;
		} else if (!jibunAddress.equals(other.jibunAddress))
			return false;
		if (latlngx == null) {
			if (other.latlngx != null)
				return false;
		} else if (!latlngx.equals(other.latlngx))
			return false;
		if (latlngy == null) {
			if (other.latlngy != null)
				return false;
		} else if (!latlngy.equals(other.latlngy))
			return false;
		if (mainImage == null) {
			if (other.mainImage != null)
				return false;
		} else if (!mainImage.equals(other.mainImage))
			return false;
		if (mainMenu == null) {
			if (other.mainMenu != null)
				return false;
		} else if (!mainMenu.equals(other.mainMenu))
			return false;
		if (markerImage == null) {
			if (other.markerImage != null)
				return false;
		} else if (!markerImage.equals(other.markerImage))
			return false;
		if (maxTable != other.maxTable)
			return false;
		if (menu == null) {
			if (other.menu != null)
				return false;
		} else if (!menu.equals(other.menu))
			return false;
		if (opDate == null) {
			if (other.opDate != null)
				return false;
		} else if (!opDate.equals(other.opDate))
			return false;
		if (opTime == null) {
			if (other.opTime != null)
				return false;
		} else if (!opTime.equals(other.opTime))
			return false;
		if (phoneNum == null) {
			if (other.phoneNum != null)
				return false;
		} else if (!phoneNum.equals(other.phoneNum))
			return false;
		if (price == null) {
			if (other.price != null)
				return false;
		} else if (!price.equals(other.price))
			return false;
		if (roadAddress == null) {
			if (other.roadAddress != null)
				return false;
		} else if (!roadAddress.equals(other.roadAddress))
			return false;
		if (score != other.score)
			return false;
		if (searchInput == null) {
			if (other.searchInput != null)
				return false;
		} else if (!searchInput.equals(other.searchInput))
			return false;
		if (searchResult == null) {
			if (other.searchResult != null)
				return false;
		} else if (!searchResult.equals(other.searchResult))
			return false;
		if (searchRocate == null) {
			if (other.searchRocate != null)
				return false;
		} else if (!searchRocate.equals(other.searchRocate))
			return false;
		if (state == null) {
			if (other.state != null)
				return false;
		} else if (!state.equals(other.state))
			return false;
		if (tableState != other.tableState)
			return false;
		if (waitingNum != other.waitingNum)
			return false;
		if (zoneCode == null) {
			if (other.zoneCode != null)
				return false;
		} else if (!zoneCode.equals(other.zoneCode))
			return false;
		return true;
	}

    
    
    
}
