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
                ", markerImage='" + markerImage + '\'' +
                ", mainImage='" + mainImage + '\'' +
                ", image1='" + image1 + '\'' +
                ", image2='" + image2 + '\'' +
                ", image3='" + image3 + '\'' +
                ", image4='" + image4 + '\'' +
                ", image5='" + image5 + '\'' +
                ", menu='" + menu + '\'' +
                ", price='" + price + '\'' +
                ", mainMenu='" + mainMenu + '\'' +
                ", searchResult=" + searchResult +
                ", searchRocate='" + searchRocate + '\'' +
                ", searchInput='" + searchInput + '\'' +
                ", latlngy='" + latlngy + '\'' +
                ", latlngx='" + latlngx + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BranchVo that = (BranchVo) o;
        return score == that.score &&
                Objects.equals(id, that.id) &&
                Objects.equals(branchName, that.branchName) &&
                Objects.equals(opTime, that.opTime) &&
                Objects.equals(breakTime, that.breakTime) &&
                Objects.equals(opDate, that.opDate) &&
                Objects.equals(phoneNum, that.phoneNum) &&
                Objects.equals(state, that.state) &&
                Objects.equals(zoneCode, that.zoneCode) &&
                Objects.equals(roadAddress, that.roadAddress) &&
                Objects.equals(jibunAddress, that.jibunAddress) &&
                Objects.equals(detailAddress, that.detailAddress) &&
                Objects.equals(markerImage, that.markerImage) &&
                Objects.equals(mainImage, that.mainImage) &&
                Objects.equals(image1, that.image1) &&
                Objects.equals(image2, that.image2) &&
                Objects.equals(image3, that.image3) &&
                Objects.equals(image4, that.image4) &&
                Objects.equals(image5, that.image5) &&
                Objects.equals(menu, that.menu) &&
                Objects.equals(price, that.price) &&
                Objects.equals(mainMenu, that.mainMenu) &&
                Objects.equals(searchResult, that.searchResult) &&
                Objects.equals(searchRocate, that.searchRocate) &&
                Objects.equals(searchInput, that.searchInput) &&
                Objects.equals(latlngy, that.latlngy) &&
                Objects.equals(latlngx, that.latlngx);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, branchName, opTime, breakTime, opDate, phoneNum, score, state, zoneCode, roadAddress, jibunAddress, detailAddress, markerImage, mainImage, image1, image2, image3, image4, image5, menu, price, mainMenu, searchResult, searchRocate, searchInput, latlngy, latlngx);
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

    public BranchVo(String id, String branchName, String opTime, String breakTime, String opDate, String phoneNum, int score, String state, String zoneCode, String roadAddress, String jibunAddress, String detailAddress, String markerImage, String mainImage, String image1, String image2, String image3, String image4, String image5, String menu, String price, String mainMenu, Map<String, Object> searchResult, String searchRocate, String searchInput, String latlngy, String latlngx) {
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
    }

    public BranchVo() {
    }
}
