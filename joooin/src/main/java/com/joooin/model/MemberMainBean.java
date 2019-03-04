package com.joooin.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

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
	private Set<GroupMainBean> groupMainSet = new LinkedHashSet<GroupMainBean>();
	private Set<GroupMemberBean> groupMemberSet = new LinkedHashSet<GroupMemberBean>();
	private Set<GroupPostBean> GroupPostSet = new LinkedHashSet<GroupPostBean>();
	private Set<GroupPostLikeBean> groupPostLikeSet = new LinkedHashSet<GroupPostLikeBean>();
	private Set<GroupPostReplyBean> groupPostReplySet = new LinkedHashSet<GroupPostReplyBean>();
	private Set<GroupChatBean> groupChatSet = new LinkedHashSet<GroupChatBean>();
	private Set<MemberFriendBean> memberFriendISet = new LinkedHashSet<MemberFriendBean>();
	private Set<MemberFriendBean> memberFriendRSet = new LinkedHashSet<MemberFriendBean>();
	private Set<MemberChatBean> memberChatSSet = new LinkedHashSet<MemberChatBean>();
	private Set<MemberChatBean> memberChatRSet = new LinkedHashSet<MemberChatBean>();
	private Set<EventMainBean> eventMainSet = new LinkedHashSet<EventMainBean>();
	private Set<EventMemberBean> eventMemberSet = new LinkedHashSet<EventMemberBean>();
	private Set<EventPostBean> eventPostSet = new LinkedHashSet<EventPostBean>();
	private Set<EventLikeBean> eventLikeSet = new LinkedHashSet<EventLikeBean>();
	private Set<ReportBean> reportMemberSet = new LinkedHashSet<ReportBean>();
	private Set<ReportBean> reportViolatorSet = new LinkedHashSet<ReportBean>();
	private Set<PunishmentBean> punishmentSet = new LinkedHashSet<PunishmentBean>();
	private Set<NotificationBean> notificationSet = new LinkedHashSet<NotificationBean>();
	
	
	public MemberMainBean(String memberName, String email, String password, String gender,
			String birthday, String city, String phone, Byte[] memberImage, Integer logins, String memberCreateDate,
			Boolean certificationStatus, String certificationHash, Boolean genderDisplay, Boolean birthdayDisplay,
			Boolean cityDisplay, Boolean emailDisplay, Boolean phoneDisplay) {
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
	}
	public MemberMainBean() {
	}
	
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="memberId", referencedColumnName="memberId")
	public Set<GroupMemberBean> getGroupMemberSet() {
		return groupMemberSet;
	}
	public void setGroupMemberSet(Set<GroupMemberBean> groupMemberSet) {
		this.groupMemberSet = groupMemberSet;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="groupLeaderId", referencedColumnName="memberId")
	public Set<GroupMainBean> getGroupMainSet() {
		return groupMainSet;
	}
	public void setGroupMainSet(Set<GroupMainBean> groupMainSet) {
		this.groupMainSet = groupMainSet;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="memberId", referencedColumnName="memberId")
	public Set<GroupPostBean> getGroupPostSet() {
		return GroupPostSet;
	}
	public void setGroupPostSet(Set<GroupPostBean> groupPostSet) {
		GroupPostSet = groupPostSet;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="memberId", referencedColumnName="memberId")
	public Set<GroupPostLikeBean> getGroupPostLikeSet() {
		return groupPostLikeSet;
	}
	public void setGroupPostLikeSet(Set<GroupPostLikeBean> groupPostLikeSet) {
		this.groupPostLikeSet = groupPostLikeSet;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="memberId", referencedColumnName="memberId")
	public Set<GroupPostReplyBean> getGroupPostReplySet() {
		return groupPostReplySet;
	}
	public void setGroupPostReplySet(Set<GroupPostReplyBean> groupPostReplySet) {
		this.groupPostReplySet = groupPostReplySet;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="memberId", referencedColumnName="memberId")
	public Set<GroupChatBean> getGroupChatSet() {
		return groupChatSet;
	}
	public void setGroupChatSet(Set<GroupChatBean> groupChatSet) {
		this.groupChatSet = groupChatSet;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="inviteMemberId", referencedColumnName="memberId")
	public Set<MemberFriendBean> getMemberFriendISet() {
		return memberFriendISet;
	}
	public void setMemberFriendISet(Set<MemberFriendBean> memberFriendISet) {
		this.memberFriendISet = memberFriendISet;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="receiveMemberId", referencedColumnName="memberId")
	public Set<MemberFriendBean> getMemberFriendRSet() {
		return memberFriendRSet;
	}
	public void setMemberFriendRSet(Set<MemberFriendBean> memberFriendRSet) {
		this.memberFriendRSet = memberFriendRSet;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="sendMemberId", referencedColumnName="memberId")
	public Set<MemberChatBean> getMemberChatSSet() {
		return memberChatSSet;
	}
	public void setMemberChatSSet(Set<MemberChatBean> memberChatSSet) {
		this.memberChatSSet = memberChatSSet;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="receiveMemberId", referencedColumnName="memberId")
	public Set<MemberChatBean> getMemberChatRSet() {
		return memberChatRSet;
	}
	public void setMemberChatRSet(Set<MemberChatBean> memberChatRSet) {
		this.memberChatRSet = memberChatRSet;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="eventInviterId", referencedColumnName="memberId")
	public Set<EventMainBean> getEventMainSet() {
		return eventMainSet;
	}
	public void setEventMainSet(Set<EventMainBean> eventMainSet) {
		this.eventMainSet = eventMainSet;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="memberId", referencedColumnName="memberId")
	public Set<EventMemberBean> getEventMemberSet() {
		return eventMemberSet;
	}
	public void setEventMemberSet(Set<EventMemberBean> eventMemberSet) {
		this.eventMemberSet = eventMemberSet;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="memberId", referencedColumnName="memberId")
	public Set<EventPostBean> getEventPostSet() {
		return eventPostSet;
	}
	public void setEventPostSet(Set<EventPostBean> eventPostSet) {
		this.eventPostSet = eventPostSet;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="memberId", referencedColumnName="memberId")
	public Set<EventLikeBean> getEventLikeSet() {
		return eventLikeSet;
	}
	public void setEventLikeSet(Set<EventLikeBean> eventLikeSet) {
		this.eventLikeSet = eventLikeSet;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="reportMemberId", referencedColumnName="memberId")
	public Set<ReportBean> getReportMemberSet() {
		return reportMemberSet;
	}
	public void setReportMemberSet(Set<ReportBean> reportMemberSet) {
		this.reportMemberSet = reportMemberSet;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="reportViolatorId", referencedColumnName="memberId")
	public Set<ReportBean> getReportViolatorSet() {
		return reportViolatorSet;
	}
	public void setReportViolatorSet(Set<ReportBean> reportViolatorSet) {
		this.reportViolatorSet = reportViolatorSet;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="punishMemberId", referencedColumnName="memberId")
	public Set<PunishmentBean> getPunishmentSet() {
		return punishmentSet;
	}
	public void setPunishmentSet(Set<PunishmentBean> punishmentSet) {
		this.punishmentSet = punishmentSet;
	}
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="punishMemberId", referencedColumnName="memberId")
	public Set<NotificationBean> getNotificationSet() {
		return notificationSet;
	}
	public void setNotificationSet(Set<NotificationBean> notificationSet) {
		this.notificationSet = notificationSet;
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

}
