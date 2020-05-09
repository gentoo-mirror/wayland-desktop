# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7} )

inherit distutils-r1

DESCRIPTION=""
HOMEPAGE="https://ripser.scikit-tda.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	dev-python/cython[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/persim[${PYTHON_USEDEP}]
	dev-python/plotly[${PYTHON_USEDEP}]
	sci-libs/scikits_learn[${PYTHON_USEDEP}]
	sci-libs/scipy[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
