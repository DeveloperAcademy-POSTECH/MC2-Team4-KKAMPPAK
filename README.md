<img width="2490" alt="kkam-park" src="https://github.com/DeveloperAcademy-POSTECH/MC2-Team4-KKAMPPAK/assets/61380136/25ce1afc-60ba-4bd9-b16b-068a2ee35377">


# MC2-Team4-KKAMPPAK
과도한 스마트폰 사용을 자각하고 눈 스트레칭을 할 수 있는 어플 (Face-tracking, Screen Time)

## 시연 영상

## 적용 기술
### 1. 개발 환경 및 언어
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white) ![Xcode](https://img.shields.io/badge/Xcode-007ACC?style=for-the-badge&logo=Xcode&logoColor=white) ![Swift](https://img.shields.io/badge/swift-F54A2A?style=for-the-badge&logo=swift&logoColor=white)

### 3. 시스템 구성 및 아키텍처
<img width="1027" alt="image" src="https://github.com/DeveloperAcademy-POSTECH/MC2-Team4-KKAMPPAK/assets/61380136/b6aa927d-3955-4656-ad3b-470fb8638390">

## 작품 소개
### 1. 개발 배경
z세대, 혹은 현재의 청소년과 젊은 세대는 스마트폰을 일상적으로 사용하며 이로 인해 스마트폰 및 미디어 중독이 사회적으로 큰 문제로 부각되고 있습니다.<br/>
특히, 청소년 중에서도 잠재적 위험군과 실제 위험군을 합치면 전체 청소년의 약 40%가 해당되는 심각한 문제로 나타나고 있습니다. 이를 심각한 문제라고 우려한 우리 팀은 청소년들을 중심으로 데스크 리서치와 유저 인터뷰를 통해 다양한 사례를 조사하였습니다. <br/>
우리가 수행한 조사 결과, 스마트폰을 과하게 사용하고 있다고 인식이 높은 사람들 중 다수가 작은 조치나 개인적인 자각 행동을 통해 스마트폰 사용을 제한하고 조절 할 수 있다는 인사이트를 얻었습니다. 이로써 우리는 스마트폰 과사용 문제를 해결하고, 청소년들에게 스마트폰 사용에 대한 인식을 높이고자, 스마트폰을 과하게 많이 사용하는걸 자각시키고 스마트폰 사용을 조절하며 환기시켜 줄 수 있는 앱을 개발하고자 했습니다. <br/>
이 앱은 사용자들이 스마트폰 사용에 대한 경각심을 높이고, 개인적인 스마트폰 사용 습관을 관리하며, 필요할 때 스스로 스마트폰 사용을 조절할 수 있는 도구로서의 역할을 수행할 것입니다. 이를 통해 청소년들과 다른 사용자들이 미디어 중독과 스마트폰 중독 문제를 극복하고, 더 건강한 디지털 생활을 즐길 수 있도록 도와주고자 합니다.


### 2. 주요 기능
#### 1) ARKit를 이용한 눈 스트레칭 루틴
| Screen                                                                                                                         | Explanation                                                                                                                                                                                                                          |
|--------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/YeonJeans/Saera-Flutter/assets/102457618/b35003e6-0fda-4d9f-86d2-27fc9d217d36" width="750"/> | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br/> 사용자는 눈 깜빡이기와 눈 움직이기 두 가지 눈 스트레칭 루틴을 수행할 수 있습니다. 사용자가 알람을 클릭하거나 앱 ‘깜빡하러 가기' 버튼을 누르면, 눈 스트레칭 루틴을 수행합니다. <br/> <br/> <br/> 1) 눈 깜빡이기 <br/> * 권장 스트레칭 속도: 30초간 10회 <br/> ARKit의 face-tracking 기능을 사용해서 눈을 깜빡였는 지 확인하여, 인터랙션(애니메이션, 햅틱 효과)을 제공합니다. <br/> <br/>  2) 눈 움직이기 <br/> * 권장 스트레칭 속도: 좌우로 15초, 상하로 15초 간 8회 <br/> 눈움직임을 ARKit의 face-tracking을 사용해서 추적하고 메인 캐릭터(깜빡이)의 움직임을 통해 적절한 인터랙션을 제공합니다. 전체 루틴에 인터랙션을 추가함으로써 사용자는 올바른 눈 스트레칭을 위한 가이드 및 반응을 확인할 수 있습니다. |



#### 2) 알람 카드 설정
사용자는 하루에 최대 3개까지의 눈 스트레칭 알람을 설정할 수 있습니다. 푸쉬 알람 구현을 위하여 User Notification Framework를 사용하였습니다. 사용자는 취침 시각 등 스마트폰 사용을 중단할 시각을 설정하여 그 시간이 되도록 스마트폰을 사용할 경우 알람을 받고 눈 스트레칭을 통해 스마트폰 사용에 집중하던 정신을 외부로 환기시키는 효과를 낼 수 있습니다. 알림은 추가하고, 수정하고, 확인하고, 삭제가 가능합니다. 

#### 3) Screen Time Api를 이용한 앱 사용 인식 알람
이 기능은 특정 앱을 사용하고 설정한 시간이 경과하면 알람을 울리게끔 해줍니다. 예를 들어, 사용자가 스마트폰에서 게임을 플레이하는 시간을 1시간 이하로 제한하려고 할 때, 앱 인식 알람은 해당 앱의 사용 시간을 추적하여 이 1시간을 초과할 시 알림을 전송합니다. 연속 사용 시간은 유저가 원할 시 언제든 수정 및 비활성화가 가능합니다. 



### 3. 기대 효과



