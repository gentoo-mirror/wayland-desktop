
EAPI="7"

inherit xdg-utils

DESCRIPTION="sweet gradient icons"
HOMEPAGE="https://github.com/EliverLara/candy-icons"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/EliverLara/candy-icons.git"
else
	COMMIT="1bc770ee96ce2aa8e333262c9f4db480ff434e53"
	SRC_URI="https://github.com/EliverLara/candy-icons/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/candy-icons-${COMMIT}"
fi

LICENSE="GPL-3"
SLOT="0"

# dead symbolic links QA
src_prepare() {
	default
	sed -e "/^Inherits/d" -i index.theme || die
	find . -xtype l -delete || die
}

src_install() {
	insinto /usr/share/icons/candy-icons
	doins -r index.theme apps devices places preferences preview
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
