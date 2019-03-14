#import "nocturnal.h"

@implementation nocturnal

//Return the icon of your module here
- (UIImage *)iconGlyph
{
	return [UIImage imageNamed:@"AppIcon" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
}

//Return the color selection color of your module here
- (UIColor *)selectedColor
{
	return [UIColor colorWithRed:(168.0/255.0) green:(180.0/255.0) blue:(75.0/255.0) alpha:1.0];
}

- (BOOL)isSelected
{
  return _selected;
}

- (void)setSelected:(BOOL)selected
{
	_selected = selected;

  [super refreshState];

  if(_selected)
  {
		NSMutableDictionary *eclipsePrefsDict = [NSMutableDictionary dictionaryWithDictionary:[NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.gmoran.eclipse.plist"]];
  	[eclipsePrefsDict setValue:[NSNumber numberWithBool:TRUE] forKey:@"enabled"];
    [eclipsePrefsDict writeToFile:@"/var/mobile/Library/Preferences/com.gmoran.eclipse.plist" atomically:TRUE];
  }
  else
  {
		NSMutableDictionary *eclipsePrefsDict = [NSMutableDictionary dictionaryWithDictionary:[NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.gmoran.eclipse.plist"]];
  	[eclipsePrefsDict setValue:[NSNumber numberWithBool:FALSE] forKey:@"enabled"];
    [eclipsePrefsDict writeToFile:@"/var/mobile/Library/Preferences/com.gmoran.eclipse.plist" atomically:TRUE];
  }
}

@end
