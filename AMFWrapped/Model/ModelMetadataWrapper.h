//
//  ModelMetadataWrapper.h
//  AMFWrapped
//
//  Created by Ron Aldrich on 4/12/23.
//

#import "ModelElementWrapper.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModelMetadataWrapper : ModelElementWrapper

+ (void) initialize;

@property (nonatomic, readwrite) NSString* type;
@property (nonatomic, readwrite) NSString* value;

@end

NS_ASSUME_NONNULL_END
