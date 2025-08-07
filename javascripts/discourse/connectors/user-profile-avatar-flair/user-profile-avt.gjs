import Component from "@ember/component";
import { classNames, tagName } from "@ember-decorators/component";
import TrustLevelAvatarFlair from "../../components/trust-level-avatar-flair";

@tagName("div")
@classNames("user-profile-avt")
export default class UserProfileAvatarTrustFlair extends Component {
  <template><TrustLevelAvatarFlair @model={{@outletArgs.model}} /></template>
}
