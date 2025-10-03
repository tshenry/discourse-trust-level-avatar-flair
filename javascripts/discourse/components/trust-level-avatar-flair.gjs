import Component from "@glimmer/component";
import { service } from "@ember/service";
import icon from "discourse/helpers/d-icon";
import { convertIconClass } from "discourse/lib/icon-library";

export default class TrustLevelAvatarFlair extends Component {
  @service site;

  get user() {
    return this.args.model;
  }

  get excludableNonhuman() {
    if (settings.exclude_nonhuman_users && this.user.id < 0) {
      return true;
    }
    return false;
  }

  get trustLevelIcon() {
    const trustIcons = [
      settings.new_user_flair_icon,
      settings.basic_user_flair_icon,
      settings.member_flair_icon,
      settings.regular_flair_icon,
      settings.leader_flair_icon,
    ];

    const trustIcon = trustIcons[this.user.trust_level];

    if (trustIcon?.includes("fa-")) {
      return convertIconClass(trustIcon);
    }

    return;
  }

  get trustLevelName() {
    return this.site.trustLevels[this.user.trust_level]?.name;
  }

  <template>
    {{#unless this.excludableNonhuman}}
      <div class="tl-avatar-flair">
        <div
          title="{{this.trustLevelName}}"
          class="tl-{{this.user.trust_level}}
            tl-flair tl-flair-{{this.user.username}}"
        >
          {{#if this.trustLevelIcon}}
            {{icon this.trustLevelIcon}}
          {{/if}}
        </div>
      </div>
    {{/unless}}
  </template>
}
