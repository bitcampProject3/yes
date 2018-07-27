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
    private String zoneCode;
    private String roadAddress;
    private String jibunAddress;
    private String detailAddress;
    private String sido;
    private String sigungu;
    private String bname1;
    private String bname2;
    private String markerImage;
    private String mainImage;
    private String image1;
    private String image2;
    private String image3;
    private String image4;
    private String image5;
    private String image6;
    private String image7;
    private String image8;
    private String menu;
    private String price;
    private String checkbox;
    private String mainMenu;
    private Map<String, Object> searchResult;
    private String searchRocate;
    private String searchInput;
    private String latlngy;
    private String latlngx;
    private String category;
    private String branchExplain;
    private int maxTable;
	private int tableState;
	private String acceptState;
	private int waitingNum;

	@Override
	public String toString() {
		return "BranchVo{" +
				"id='" + id + '\'' +
				", branchName='" + branchName + '\'' +
				", opTime='" + opTime + '\'' +
				", breakTime='" + breakTime + '\'' +
				", opDate='" + opDate + '\'' +
				", phoneNum='" + phoneNum + '\'' +
				", score=" + score +
				", state='" + state + '\'' +
				", zoneCode='" + zoneCode + '\'' +
				", roadAddress='" + roadAddress + '\'' +
				", jibunAddress='" + jibunAddress + '\'' +
				", detailAddress='" + detailAddress + '\'' +
				", sido='" + sido + '\'' +
				", sigungu='" + sigungu + '\'' +
				", bname1='" + bname1 + '\'' +
				", bname2='" + bname2 + '\'' +
				", markerImage='" + markerImage + '\'' +
				", mainImage='" + mainImage + '\'' +
				", image1='" + image1 + '\'' +
				", image2='" + image2 + '\'' +
				", image3='" + image3 + '\'' +
				", image4='" + image4 + '\'' +
				", image5='" + image5 + '\'' +
				", image6='" + image6 + '\'' +
				", image7='" + image7 + '\'' +
				", image8='" + image8 + '\'' +
				", menu='" + menu + '\'' +
				", price='" + price + '\'' +
				", checkbox='" + checkbox + '\'' +
				", mainMenu='" + mainMenu + '\'' +
				", searchResult=" + searchResult +
				", searchRocate='" + searchRocate + '\'' +
				", searchInput='" + searchInput + '\'' +
				", latlngy='" + latlngy + '\'' +
				", latlngx='" + latlngx + '\'' +
				", category='" + category + '\'' +
				", branchExplain='" + branchExplain + '\'' +
				", maxTable=" + maxTable +
				", tableState=" + tableState +
				", acceptState='" + acceptState + '\'' +
				", waitingNum=" + waitingNum +
				'}';
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		BranchVo branchVo = (BranchVo) o;
		return score == branchVo.score &&
				maxTable == branchVo.maxTable &&
				tableState == branchVo.tableState &&
				waitingNum == branchVo.waitingNum &&
				Objects.equals(id, branchVo.id) &&
				Objects.equals(branchName, branchVo.branchName) &&
				Objects.equals(opTime, branchVo.opTime) &&
				Objects.equals(breakTime, branchVo.breakTime) &&
				Objects.equals(opDate, branchVo.opDate) &&
				Objects.equals(phoneNum, branchVo.phoneNum) &&
				Objects.equals(state, branchVo.state) &&
				Objects.equals(zoneCode, branchVo.zoneCode) &&
				Objects.equals(roadAddress, branchVo.roadAddress) &&
				Objects.equals(jibunAddress, branchVo.jibunAddress) &&
				Objects.equals(detailAddress, branchVo.detailAddress) &&
				Objects.equals(sido, branchVo.sido) &&
				Objects.equals(sigungu, branchVo.sigungu) &&
				Objects.equals(bname1, branchVo.bname1) &&
				Objects.equals(bname2, branchVo.bname2) &&
				Objects.equals(markerImage, branchVo.markerImage) &&
				Objects.equals(mainImage, branchVo.mainImage) &&
				Objects.equals(image1, branchVo.image1) &&
				Objects.equals(image2, branchVo.image2) &&
				Objects.equals(image3, branchVo.image3) &&
				Objects.equals(image4, branchVo.image4) &&
				Objects.equals(image5, branchVo.image5) &&
				Objects.equals(image6, branchVo.image6) &&
				Objects.equals(image7, branchVo.image7) &&
				Objects.equals(image8, branchVo.image8) &&
				Objects.equals(menu, branchVo.menu) &&
				Objects.equals(price, branchVo.price) &&
				Objects.equals(checkbox, branchVo.checkbox) &&
				Objects.equals(mainMenu, branchVo.mainMenu) &&
				Objects.equals(searchResult, branchVo.searchResult) &&
				Objects.equals(searchRocate, branchVo.searchRocate) &&
				Objects.equals(searchInput, branchVo.searchInput) &&
				Objects.equals(latlngy, branchVo.latlngy) &&
				Objects.equals(latlngx, branchVo.latlngx) &&
				Objects.equals(category, branchVo.category) &&
				Objects.equals(branchExplain, branchVo.branchExplain) &&
				Objects.equals(acceptState, branchVo.acceptState);
	}

	@Override
	public int hashCode() {

		return Objects.hash(id, branchName, opTime, breakTime, opDate, phoneNum, score, state, zoneCode, roadAddress, jibunAddress, detailAddress, sido, sigungu, bname1, bname2, markerImage, mainImage, image1, image2, image3, image4, image5, image6, image7, image8, menu, price, checkbox, mainMenu, searchResult, searchRocate, searchInput, latlngy, latlngx, category, branchExplain, maxTable, tableState, acceptState, waitingNum);
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

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getSigungu() {
		return sigungu;
	}

	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}

	public String getBname1() {
		return bname1;
	}

	public void setBname1(String bname1) {
		this.bname1 = bname1;
	}

	public String getBname2() {
		return bname2;
	}

	public void setBname2(String bname2) {
		this.bname2 = bname2;
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

	public String getImage6() {
		return image6;
	}

	public void setImage6(String image6) {
		this.image6 = image6;
	}

	public String getImage7() {
		return image7;
	}

	public void setImage7(String image7) {
		this.image7 = image7;
	}

	public String getImage8() {
		return image8;
	}

	public void setImage8(String image8) {
		this.image8 = image8;
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

	public String getCheckbox() {
		return checkbox;
	}

	public void setCheckbox(String checkbox) {
		this.checkbox = checkbox;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBranchExplain() {
		return branchExplain;
	}

	public void setBranchExplain(String branchExplain) {
		this.branchExplain = branchExplain;
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

	public BranchVo(String id, String branchName, String opTime, String breakTime, String opDate, String phoneNum, int score, String state, String zoneCode, String roadAddress, String jibunAddress, String detailAddress, String sido, String sigungu, String bname1, String bname2, String markerImage, String mainImage, String image1, String image2, String image3, String image4, String image5, String image6, String image7, String image8, String menu, String price, String checkbox, String mainMenu, Map<String, Object> searchResult, String searchRocate, String searchInput, String latlngy, String latlngx, String category, String branchExplain, int maxTable, int tableState, String acceptState, int waitingNum) {
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
		this.sido = sido;
		this.sigungu = sigungu;
		this.bname1 = bname1;
		this.bname2 = bname2;
		this.markerImage = markerImage;
		this.mainImage = mainImage;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.image4 = image4;
		this.image5 = image5;
		this.image6 = image6;
		this.image7 = image7;
		this.image8 = image8;
		this.menu = menu;
		this.price = price;
		this.checkbox = checkbox;
		this.mainMenu = mainMenu;
		this.searchResult = searchResult;
		this.searchRocate = searchRocate;
		this.searchInput = searchInput;
		this.latlngy = latlngy;
		this.latlngx = latlngx;
		this.category = category;
		this.branchExplain = branchExplain;
		this.maxTable = maxTable;
		this.tableState = tableState;
		this.acceptState = acceptState;
		this.waitingNum = waitingNum;
	}

	public BranchVo() {
	}
}
