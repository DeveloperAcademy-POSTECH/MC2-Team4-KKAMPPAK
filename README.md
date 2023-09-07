# MC2-Team4-KKAMPPAK
<img width="2490" alt="kkam-park" src="https://github.com/DeveloperAcademy-POSTECH/MC2-Team4-KKAMPPAK/assets/61380136/25ce1afc-60ba-4bd9-b16b-068a2ee35377">
과도한 스마트폰 사용을 자각하고 눈 스트레칭을 할 수 있는 어플 (Face-tracking, Screen Time)

## 🎥 시연 영상
![KKAMPPAK](https://www.youtube.com/watch?v=2RLvLtNcXAI)

<br/>

## 💻 적용 기술
### 1. 개발 환경 및 언어
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white) ![Xcode](https://img.shields.io/badge/Xcode-007ACC?style=for-the-badge&logo=Xcode&logoColor=white) ![Swift](https://img.shields.io/badge/swift-F54A2A?style=for-the-badge&logo=swift&logoColor=white)

### 2. 시스템 구성 및 아키텍처
<img width="1027" alt="image" src="https://github.com/DeveloperAcademy-POSTECH/MC2-Team4-KKAMPPAK/assets/61380136/b6aa927d-3955-4656-ad3b-470fb8638390">

<br/>

<br/>

## 📝 작품 소개
### 1. 개발 배경
z세대, 혹은 현재의 청소년과 젊은 세대는 스마트폰을 일상적으로 사용하며 이로 인해 스마트폰 및 미디어 중독이 사회적으로 큰 문제로 부각되고 있습니다.<br/>
특히, 청소년 중에서도 잠재적 위험군과 실제 위험군을 합치면 전체 청소년의 약 40%가 해당되는 심각한 문제로 나타나고 있습니다. 이를 심각한 문제라고 우려한 우리 팀은 청소년들을 중심으로 데스크 리서치와 유저 인터뷰를 통해 다양한 사례를 조사하였습니다. <br/>
우리가 수행한 조사 결과, 스마트폰을 과하게 사용하고 있다고 인식이 높은 사람들 중 다수가 작은 조치나 개인적인 자각 행동을 통해 스마트폰 사용을 제한하고 조절 할 수 있다는 인사이트를 얻었습니다. 이로써 우리는 스마트폰 과사용 문제를 해결하고, 청소년들에게 스마트폰 사용에 대한 인식을 높이고자, 스마트폰을 과하게 많이 사용하는걸 자각시키고 스마트폰 사용을 조절하며 환기시켜 줄 수 있는 앱을 개발하고자 했습니다. <br/>
이 앱은 사용자들이 스마트폰 사용에 대한 경각심을 높이고, 개인적인 스마트폰 사용 습관을 관리하며, 필요할 때 스스로 스마트폰 사용을 조절할 수 있는 도구로서의 역할을 수행할 것입니다. 이를 통해 청소년들과 다른 사용자들이 미디어 중독과 스마트폰 중독 문제를 극복하고, 더 건강한 디지털 생활을 즐길 수 있도록 도와주고자 합니다.


### 2. 주요 기능
#### 1) ARKit를 이용한 눈 스트레칭 루틴
| Screen                                                                                                                         | Explanation                                                                                                                                                                                                                          |
|--------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/DeveloperAcademy-POSTECH/MC2-Team4-KKAMPPAK/assets/61380136/e1cad3a4-cae5-49a0-ace0-7165f92343a8" width="250"/> | <br/> 사용자는 눈 깜빡이기와 눈 움직이기 두 가지 눈 스트레칭 루틴을 수행할 수 있습니다. 사용자가 알람을 클릭하거나 앱 ‘깜빡하러 가기' 버튼을 누르면, 눈 스트레칭 루틴을 수행합니다. <br/> <br/> <br/> 1) 눈 깜빡이기 <br/> * 권장 스트레칭 속도: 30초간 10회 <br/> ARKit의 face-tracking 기능을 사용해서 눈을 깜빡였는 지 확인하여, 인터랙션(애니메이션, 햅틱 효과)을 제공합니다. <br/> <br/>  2) 눈 움직이기 <br/> * 권장 스트레칭 속도: 좌우로 15초, 상하로 15초 간 8회 <br/> 눈움직임을 ARKit의 face-tracking을 사용해서 추적하고 메인 캐릭터(깜빡이)의 움직임을 통해 적절한 인터랙션을 제공합니다. <br/> 전체 루틴에 인터랙션을 추가함으로써 사용자는 올바른 눈 스트레칭을 위한 가이드 및 반응을 확인할 수 있습니다. <br/>  <br/> |


#### 2) 알람 카드 설정
| Screen                                                                                                                         | Explanation                                                                                                                                                                                                                          |
|--------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/DeveloperAcademy-POSTECH/MC2-Team4-KKAMPPAK/assets/61380136/2ec01d0b-6cdd-4f4a-b800-fe5a1d1d6ef5" width="250"/> | <br/> 사용자는 하루에 최대 3개까지의 눈 스트레칭 알람을 설정할 수 있습니다. <br/> 사용자는 취침 시각과 같이 스마트폰 사용을 중단하고 눈 스트래칭을 진행할 시각을 설정하고 해당 시간에 스마트폰을 사용하고 있을 경우 푸시 알람을 받고 눈 스트레칭을 진행하도록 하여 지속적인 스마트폰 사용을 저지할 수 있습니다.  <br/>  <br/> |

#### 3) Screen Time Api를 이용한 앱 사용 인식 알람
| Screen                                                                                                                         | Explanation                                                                                                                                                                                                                          |
|--------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://github.com/DeveloperAcademy-POSTECH/MC2-Team4-KKAMPPAK/assets/61380136/19f83729-b80a-4311-8eff-590b62601744" width="250"/> | <br/> Screen Time API를 이용하여 특정 앱을 사용할 때 설정한 핸드폰 사용 시간이 경과하면 알람을 울리게끔 해줍니다. <br/> 예를 들어, 사용자가 스마트폰에서 게임을 플레이하는 시간을 1시간 이하로 제한하려고 할 때, Screen TIme API는 해당 앱의 사용 시간을 추적하여 앱 사용 시간이 1시간을 초과할 시 알림을 전송합니다.  <br/>  <br/> |



### 3. 기대 효과
#### 1) 스마트폰 사용 트래킹을 통한 중독 예방
본 서비스는 과도한 스마트폰 사용에 대한 경각심을 인지하고 있는 z세대입니다. 이들은 본인의 사용량에 대한 알람을 받는 것 만으로 충분히 스마트폰 사용을 중단할 수 있는 사람입니다. 선호하는 알람 방식 (시간 혹은 시각)을 지정함으로써 사용자는 스마트폰 중독을 예방할 수 있습니다.  
#### 2) 눈 스트레칭
디지털기기의 사용에 관한 연구들은 하나같이 눈 깜빡임의 병적인 변화를 주목합니다. 일반적인 눈 깜빡임은 1분에 10~12회 정도인 반면, 디지털기기를 사용하게 되면 그 횟수가 3~5회로 감소하게 됩니다. 일상에서 할 수 있는 가장 기본적이면서도 필수적인 것은 ‘눈 깜빡임의 교정’입니다. 눈을 의식적으로 4초당 1회, 1분에 15회 이상 깜빡거리기만 해도 눈물량이 정상으로 돌아와, 눈에 수분과 영양이 활발하게 공급됩니다. 안구건조증 및 그에 따른 각종 각막질환을 효과적으로 예방할 수 있는 눈 운동입니다. 이 눈 스트레칭 루틴은 사시 교정 등 의료 목적으로도 사용될 수 있습니다.  


