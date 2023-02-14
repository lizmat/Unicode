# This is basically cat-licensed from src/core.c/Unicode
my class Unicode {
    my constant NFG = $*VM.name eq 'moar';

    my constant VERSION = Version.new( (
       '1.1' => 'a',
       '2.0' => 'ẛ',
       '2.1' => '€',
       '3.0' => 'ϟ',
       '3.1' => 'ϴ',
       '3.2' => '⁇',
       '4.0' => 'ȡ',
       '4.1' => 'ℼ',
       '5.0' => 'ↄ',
       '5.1' => 'Ϗ',
       '5.2' => 'Ɒ',
       '6.0' => '✅',
       '6.1' => 'Ɦ',
       '6.2' => '₺',
       '6.3' =>  0x061C.chr,
       '7.0' =>  0x037F.chr,
       '8.0' =>  0x218A.chr,
       '9.0' =>  0xA7AE.chr,
      '10.0' =>  0x20BF.chr,
      '11.0' =>  0xA7AF.chr,
      '12.0' =>  0xA7BA.chr,
      '12.1' =>  0x32FF.chr,
      '13.0' => 0x1F972.chr,
      '14.0' =>  0x061D.chr,
      '15.0' =>  0x0CF3.chr,
    # PLEASE ADD NEWER UNICODE VERSIONS HERE, AS SOON AS THE UNICODE
    # CONSORTIUM HAS RELEASED A NEW VERSION
    ).first(*.value.uniprop('Age') ne 'Unassigned', :end).key);

    has Version $.version = VERSION;
    has Bool    $.NFG     = NFG;

    proto method version(|) {*}
    multi method version(Unicode:U:) { VERSION   }
    multi method version(Unicode:D:) { $!version }

    proto method NFG(|) {*}
    multi method NFG(Unicode:U:) { NFG   }
    multi method NFG(Unicode:D:) { $!NFG }
}

my sub EXPORT() {
    BEGIN CORE::Unicode =:= Nil
      ?? Map.new( Pair.new("Unicode", Unicode) )
      !! Map.new
}

=begin pod

=head1 NAME

Unicode - provide information about Unicode versions

=head1 SYNOPSIS

=begin code :lang<raku>

use Unicode;

=end code

=head1 DESCRIPTION

The C<Unicode> class provided information about the (current)
Unicode version supported.

It was introduced in Rakudo release 2023.02.  It is provided
here to allow the functionality to be used with older versions
of Rakudo.

If Rakudo already supplies a C<Unicode> class, then loading
this module will effectively be a no-op.

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Unicode .
Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing
to a L<small sponsorship|https://github.com/sponsors/lizmat/> would
mean a great deal to me!

=head1 COPYRIGHT AND LICENSE

Copyright 2023 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
