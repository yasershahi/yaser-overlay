# Custom overlay ebuild: emacs-31.1-r3 with harfbuzz enabled (Persian text shaping)
# Shadows ::gentoo emacs-31.1-r2. Build via .github/workflows/build-emacs.yml.
EAPI=8
DESCRIPTION="The extensible, customizable, free/libre text editor (harfbuzz for RTL)"
HOMEPAGE="https://www.gnu.org/software/emacs/"

inherit elisp-common

LICENSE="GPL-3+"
SLOT="31"
KEYWORDS="~amd64"

# Force shaping engine for Persian/Arabic letter joining
IUSE="harfbuzz gtk xft +harfbuzz"
REQUIRED_USE="^^ ( gtk )"

# Reference gentoo source / distfiles; overlay build pulls from ::gentoo base
DEPEND="
	harfbuzz? ( media-libs/harfbuzz )
	gtk? ( x11-libs/gtk+ )
	xft? ( media-libs/freetype )
"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}-31.1

# Overlay build uses gentoo's source tarball; configure handles USE
src_configure() {
	default
	ebuild_configure --with-harfbuzz --with-xft --with-gtk
}
