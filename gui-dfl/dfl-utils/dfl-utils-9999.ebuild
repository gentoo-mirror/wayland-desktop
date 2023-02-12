# Copyright 2022 Aisha Tammy
# Distributed under the terms of the ISC License

EAPI=8

inherit meson

DESCRIPTION="Helper utilities for the DFL project"
HOMEPAGE="https://gitlab.com/desktop-frameworks/utils"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.com/desktop-frameworks/utils"
else
	COMMIT="30575a0fd2e50f2b655009c7cbc4a946794973b4"
	SRC_URI="https://gitlab.com/desktop-frameworks/utils/-/archive/${COMMIT}/utils-${COMMIT}.tar.bz2 -> ${P}.tar.bz2"
	S="${WORKDIR}/utils-${COMMIT}"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="+qt5 qt6"
REQUIRED_USE="^^ ( qt5 qt6 )"

DEPEND="
	qt5? (
		dev-qt/qtcore:5
	)
	qt6? (
		dev-qt/qtbase:6
	)
"
RDEPEND="
	${DEPEND}
"
BDEPEND="
	virtual/pkgconfig
"

src_configure() {
	local emesonargs=(
		"-Duse_qt_version=$(usex qt5 qt5 qt6)"
	)
	meson_src_configure
}
