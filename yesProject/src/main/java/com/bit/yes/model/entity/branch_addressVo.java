package com.bit.yes.model.entity;

public class branch_addressVo {
	  private String id;
	  private String zoneCode;
	  private String roadAddress;
	  private String jibunAddress;
	  private String detailAddress;
	  private String sido;
	  private String sigungu;
	  private String bname;
	  private String bname2;
	  private String latlngx;
	  private String latlngy;
	  
	  public branch_addressVo() {
		// TODO Auto-generated constructor stub
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getBname2() {
		return bname2;
	}

	public void setBname2(String bname2) {
		this.bname2 = bname2;
	}

	public String getLatlngx() {
		return latlngx;
	}

	public void setLatlngx(String latlngx) {
		this.latlngx = latlngx;
	}

	public String getLatlngy() {
		return latlngy;
	}

	public void setLatlngy(String latlngy) {
		this.latlngy = latlngy;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bname == null) ? 0 : bname.hashCode());
		result = prime * result + ((bname2 == null) ? 0 : bname2.hashCode());
		result = prime * result + ((detailAddress == null) ? 0 : detailAddress.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((jibunAddress == null) ? 0 : jibunAddress.hashCode());
		result = prime * result + ((latlngx == null) ? 0 : latlngx.hashCode());
		result = prime * result + ((latlngy == null) ? 0 : latlngy.hashCode());
		result = prime * result + ((roadAddress == null) ? 0 : roadAddress.hashCode());
		result = prime * result + ((sido == null) ? 0 : sido.hashCode());
		result = prime * result + ((sigungu == null) ? 0 : sigungu.hashCode());
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
		branch_addressVo other = (branch_addressVo) obj;
		if (bname == null) {
			if (other.bname != null)
				return false;
		} else if (!bname.equals(other.bname))
			return false;
		if (bname2 == null) {
			if (other.bname2 != null)
				return false;
		} else if (!bname2.equals(other.bname2))
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
		if (roadAddress == null) {
			if (other.roadAddress != null)
				return false;
		} else if (!roadAddress.equals(other.roadAddress))
			return false;
		if (sido == null) {
			if (other.sido != null)
				return false;
		} else if (!sido.equals(other.sido))
			return false;
		if (sigungu == null) {
			if (other.sigungu != null)
				return false;
		} else if (!sigungu.equals(other.sigungu))
			return false;
		if (zoneCode == null) {
			if (other.zoneCode != null)
				return false;
		} else if (!zoneCode.equals(other.zoneCode))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "branch_addressVo [id=" + id + ", zoneCode=" + zoneCode + ", roadAddress=" + roadAddress
				+ ", jibunAddress=" + jibunAddress + ", detailAddress=" + detailAddress + ", sido=" + sido
				+ ", sigungu=" + sigungu + ", bname=" + bname + ", bname2=" + bname2 + ", latlngx=" + latlngx
				+ ", latlngy=" + latlngy + "]";
	}

	public branch_addressVo(String id, String zoneCode, String roadAddress, String jibunAddress, String detailAddress,
			String sido, String sigungu, String bname, String bname2, String latlngx, String latlngy) {
		super();
		this.id = id;
		this.zoneCode = zoneCode;
		this.roadAddress = roadAddress;
		this.jibunAddress = jibunAddress;
		this.detailAddress = detailAddress;
		this.sido = sido;
		this.sigungu = sigungu;
		this.bname = bname;
		this.bname2 = bname2;
		this.latlngx = latlngx;
		this.latlngy = latlngy;
	}
	  
	  
}
