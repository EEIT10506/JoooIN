package com.joooin.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="member_main")
public class MemberMainBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer memberId;
	private String memberName;
	private String email;
	private String password;
	private String gender;
	private String birthday;
	private String city;
	private String phone;
	private Byte[] memberImage;
	private Integer logins;
	private String memberCreateDate;
	private Boolean certificationStatus;
	private String certificationHash;
	private Boolean genderDisplay;
	private Boolean birthdayDisplay;
	private Boolean cityDisplay;
	private Boolean emailDisplay;
	private Boolean phoneDisplay;
	private String memberIntro;
	private MultipartFile multipartFile;
	private List<GroupMainBean> groupMainList = new ArrayList<GroupMainBean>();
	private List<GroupMemberBean> groupMemberList = new ArrayList<GroupMemberBean>();
	private List<GroupPostBean> GroupPostList = new ArrayList<GroupPostBean>();
	private List<GroupPostLikeBean> groupPostLikeList = new ArrayList<GroupPostLikeBean>();
	private List<GroupPostReplyBean> groupPostReplyList = new ArrayList<GroupPostReplyBean>();
	private List<GroupChatBean> groupChatList = new ArrayList<GroupChatBean>();
	private List<MemberFriendBean> memberFriendIList = new ArrayList<MemberFriendBean>();
	private List<MemberFriendBean> memberFriendRList = new ArrayList<MemberFriendBean>();
	private List<MemberChatBean> memberChatSList = new ArrayList<MemberChatBean>();
	private List<MemberChatBean> memberChatRList = new ArrayList<MemberChatBean>();
	private List<EventMainBean> eventMainList = new ArrayList<EventMainBean>();
	private List<EventMemberBean> eventMemberList = new ArrayList<EventMemberBean>();
	private List<EventPostBean> eventPostList = new ArrayList<EventPostBean>();
	private List<EventLikeBean> eventLikeList = new ArrayList<EventLikeBean>();
	private List<ReportBean> reportMemberList = new ArrayList<ReportBean>();
	private List<ReportBean> reportViolatorList = new ArrayList<ReportBean>();
	private List<PunishmentBean> punishmentList = new ArrayList<PunishmentBean>();
	private List<NotificationBean> notificationList = new ArrayList<NotificationBean>();
	
	
	public MemberMainBean(String memberName, String email, String password, String gender,
			String birthday, String city, String phone, Byte[] memberImage, Integer logins, String memberCreateDate,
			Boolean certificationStatus, String certificationHash, Boolean genderDisplay, Boolean birthdayDisplay,
			Boolean cityDisplay, Boolean emailDisplay, Boolean phoneDisplay, String memberIntro) {
		this.memberName = memberName;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.birthday = birthday;
		this.city = city;
		this.phone = phone;
		this.memberImage = memberImage;
		this.logins = logins;
		this.memberCreateDate = memberCreateDate;
		this.certificationStatus = certificationStatus;
		this.certificationHash = certificationHash;
		this.genderDisplay = genderDisplay;
		this.birthdayDisplay = birthdayDisplay;
		this.cityDisplay = cityDisplay;
		this.emailDisplay = emailDisplay;
		this.phoneDisplay = phoneDisplay;
		this.memberIntro = memberIntro;
		
	}
	public MemberMainBean() {
	}
	
	@Transient
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}
	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="memberId", referencedColumnName="memberId")
	public List<GroupMemberBean> getGroupMemberList() {
		return groupMemberList;
	}
	public void setGroupMemberList(List<GroupMemberBean> groupMemberList) {
		this.groupMemberList = groupMemberList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="groupLeaderId", referencedColumnName="memberId")
	public List<GroupMainBean> getGroupMainList() {
		return groupMainList;
	}
	public void setGroupMainList(List<GroupMainBean> groupMainList) {
		this.groupMainList = groupMainList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="memberId", referencedColumnName="memberId")
	public List<GroupPostBean> getGroupPostList() {
		return GroupPostList;
	}
	public void setGroupPostList(List<GroupPostBean> groupPostList) {
		GroupPostList = groupPostList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="memberId", referencedColumnName="memberId")
	public List<GroupPostLikeBean> getGroupPostLikeList() {
		return groupPostLikeList;
	}
	public void setGroupPostLikeList(List<GroupPostLikeBean> groupPostLikeList) {
		this.groupPostLikeList = groupPostLikeList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="memberId", referencedColumnName="memberId")
	public List<GroupPostReplyBean> getGroupPostReplyList() {
		return groupPostReplyList;
	}
	public void setGroupPostReplyList(List<GroupPostReplyBean> groupPostReplyList) {
		this.groupPostReplyList = groupPostReplyList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="memberId", referencedColumnName="memberId")
	public List<GroupChatBean> getGroupChatList() {
		return groupChatList;
	}
	public void setGroupChatList(List<GroupChatBean> groupChatList) {
		this.groupChatList = groupChatList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="inviteMemberId", referencedColumnName="memberId")
	public List<MemberFriendBean> getMemberFriendIList() {
		return memberFriendIList;
	}
	public void setMemberFriendIList(List<MemberFriendBean> memberFriendIList) {
		this.memberFriendIList = memberFriendIList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="receiveMemberId", referencedColumnName="memberId")
	public List<MemberFriendBean> getMemberFriendRList() {
		return memberFriendRList;
	}
	public void setMemberFriendRList(List<MemberFriendBean> memberFriendRList) {
		this.memberFriendRList = memberFriendRList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="sendMemberId", referencedColumnName="memberId")
	public List<MemberChatBean> getMemberChatSList() {
		return memberChatSList;
	}
	public void setMemberChatSList(List<MemberChatBean> memberChatSList) {
		this.memberChatSList = memberChatSList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="receiveMemberId", referencedColumnName="memberId")
	public List<MemberChatBean> getMemberChatRList() {
		return memberChatRList;
	}
	public void setMemberChatRList(List<MemberChatBean> memberChatRList) {
		this.memberChatRList = memberChatRList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="eventInviterId", referencedColumnName="memberId")
	public List<EventMainBean> getEventMainList() {
		return eventMainList;
	}
	public void setEventMainList(List<EventMainBean> eventMainList) {
		this.eventMainList = eventMainList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="memberId", referencedColumnName="memberId")
	public List<EventMemberBean> getEventMemberList() {
		return eventMemberList;
	}
	public void setEventMemberList(List<EventMemberBean> eventMemberList) {
		this.eventMemberList = eventMemberList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="memberId", referencedColumnName="memberId")
	public List<EventPostBean> getEventPostList() {
		return eventPostList;
	}
	public void setEventPostList(List<EventPostBean> eventPostList) {
		this.eventPostList = eventPostList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="memberId", referencedColumnName="memberId")
	public List<EventLikeBean> getEventLikeList() {
		return eventLikeList;
	}
	public void setEventLikeList(List<EventLikeBean> eventLikeList) {
		this.eventLikeList = eventLikeList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="reportMemberId", referencedColumnName="memberId")
	public List<ReportBean> getReportMemberList() {
		return reportMemberList;
	}
	public void setReportMemberList(List<ReportBean> reportMemberList) {
		this.reportMemberList = reportMemberList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="reportViolatorId", referencedColumnName="memberId")
	public List<ReportBean> getReportViolatorList() {
		return reportViolatorList;
	}
	public void setReportViolatorList(List<ReportBean> reportViolatorList) {
		this.reportViolatorList = reportViolatorList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="punishMemberId", referencedColumnName="memberId")
	public List<PunishmentBean> getPunishmentList() {
		return punishmentList;
	}
	public void setPunishmentList(List<PunishmentBean> punishmentList) {
		this.punishmentList = punishmentList;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="punishMemberId", referencedColumnName="memberId")
	public List<NotificationBean> getNotificationList() {
		return notificationList;
	}
	public void setNotificationList(List<NotificationBean> notificationList) {
		this.notificationList = notificationList;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Byte[] getMemberImage() {
		return memberImage;
	}

	public void setMemberImage(Byte[] memberImage) {
		this.memberImage = memberImage;
	}

	public Integer getLogins() {
		return logins;
	}

	public void setLogins(Integer logins) {
		this.logins = logins;
	}

	public String getMemberCreateDate() {
		return memberCreateDate;
	}

	public void setMemberCreateDate(String memberCreateDate) {
		this.memberCreateDate = memberCreateDate;
	}

	public Boolean getCertificationStatus() {
		return certificationStatus;
	}

	public void setCertificationStatus(Boolean certificationStatus) {
		this.certificationStatus = certificationStatus;
	}

	public String getCertificationHash() {
		return certificationHash;
	}

	public void setCertificationHash(String certificationHash) {
		this.certificationHash = certificationHash;
	}

	public Boolean getGenderDisplay() {
		return genderDisplay;
	}

	public void setGenderDisplay(Boolean genderDisplay) {
		this.genderDisplay = genderDisplay;
	}

	public Boolean getBirthdayDisplay() {
		return birthdayDisplay;
	}

	public void setBirthdayDisplay(Boolean birthdayDisplay) {
		this.birthdayDisplay = birthdayDisplay;
	}

	public Boolean getCityDisplay() {
		return cityDisplay;
	}

	public void setCityDisplay(Boolean cityDisplay) {
		this.cityDisplay = cityDisplay;
	}

	public Boolean getEmailDisplay() {
		return emailDisplay;
	}

	public void setEmailDisplay(Boolean emailDisplay) {
		this.emailDisplay = emailDisplay;
	}

	public Boolean getPhoneDisplay() {
		return phoneDisplay;
	}

	public void setPhoneDisplay(Boolean phoneDisplay) {
		this.phoneDisplay = phoneDisplay;
	}
	@Override
	public String toString() {
		return "MemberMainBean [memberId=" + memberId + ", memberName=" + memberName + ", email=" + email
				+ ", password=" + password + ", gender=" + gender + ", birthday=" + birthday + ", city=" + city
				+ ", phone=" + phone + ", memberImage=" + Arrays.toString(memberImage) + ", logins=" + logins
				+ ", memberCreateDate=" + memberCreateDate + ", certificationStatus=" + certificationStatus
				+ ", certificationHash=" + certificationHash + ", genderDisplay=" + genderDisplay + ", birthdayDisplay="
				+ birthdayDisplay + ", cityDisplay=" + cityDisplay + ", emailDisplay=" + emailDisplay
				+ ", phoneDisplay=" + phoneDisplay + "]";
	}
	public String getMemberIntro() {
		return memberIntro;
	}
	public void setMemberIntro(String memberIntro) {
		this.memberIntro = memberIntro;
	}
	

}
