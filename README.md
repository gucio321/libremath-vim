# LIBREMATH-VIM

## DESCRIPTION

Libremath-vim is a syntax highlighting for [Vim](https://github.com/vim) (and VIM-based editors)
of LibreOffice Math formula language.

Generally that repo creates completly new fileformat called `.lm` (stands from Libreoffice Math).
You can create such a file (e.g. by `touch myFormula.lm`) and than
edit it (with `vim myFormula.lm`). After that, you should be able to
copy content of that file and put 1:1 into LibreOffice Math formula field.

## DOCUMENTATION AND COPYRIGHT NOTES

[here](https://documentation.libreoffice.org/assets/Uploads/Documentation/en/GS5.1/HTML/GS5109-GettingStartedWithMath.html)
you can see explanation what is exactly LibreOffice Math.

And here is a [LibreOffice Math Guide](https://documentation.libreoffice.org/assets/Uploads/Documentation/en/MG7.0/MG70-MathGuide.pdf)

## INSTALLATION

### Vundle

Add the following line in your plugins list inside of `.vimrc` file.
For issues with vundle installation, please reffer to [Vundle's guides](https://github.com/VundleVim/Vundle.vim)

```vim
Plugin 'gucio321/libremath-vim'
```

I strongly recommend using Vundle as I haven't tested the plugin other way :grinning:.
If you did so, let me know by opening Issue with another installation isntruction.

## CONTRIBUTION

Feel free to contribute to this repository. All kind of Pull Requests and Issues are welcome.

## LICENSE

This vim syntax was completly written by me and shared under GPL v3 license.
