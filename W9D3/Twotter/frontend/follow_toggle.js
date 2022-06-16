function FollowToggle (el, options) {
    this.userId = el.dataset.userId || options.userId;
    this.followState = el.dataset.followState || options.followState;
    let jq = $(el)
}

module.exports = FollowToggle;