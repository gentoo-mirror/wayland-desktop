# Copyright 2022 Aisha Tammy <floss@bsd.ac>
# Distributed under the terms of the ISC License

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1

DESCRIPTION="Wayland compositor for laptops and touchpads."
HOMEPAGE="https://github.com/jbuchermn/newm"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jbuchermn/newm.git"
else
	SRC_URI="https://github.com/jbuchermn/newm/archive/refs/tags/v0.3alpha.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${PN}-0.3alpha"
fi

LICENSE="MIT"

SLOT="0"
DEPEND="
	$(python_gen_cond_dep '
		dev-python/dasbus[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/pycairo[${PYTHON_USEDEP}]
		dev-python/pyfiglet[${PYTHON_USEDEP}]
		dev-python/python-pam[${PYTHON_USEDEP}]
		dev-python/pywm[${PYTHON_USEDEP}]
		dev-python/thefuzz[${PYTHON_USEDEP}]
	')
"
RDEPEND="${DEPEND}"

distutils_enable_tests pytest
