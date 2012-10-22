//
//  OutputDestination.m
//  H264Streamer
//
//  Created by Zakk on 9/16/12.
//  Copyright (c) 2012 Zakk. All rights reserved.
//

#import "OutputDestination.h"

@implementation OutputDestination




-(void) encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:self.destination forKey:@"destination"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.type_name forKey:@"type_name"];
    [aCoder encodeObject:self.output_format forKey:@"output_format"];
}

-(id) initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        self.destination = [aDecoder decodeObjectForKey:@"destination"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.type_name = [aDecoder decodeObjectForKey:@"type_name"];
        self.output_format = [aDecoder decodeObjectForKey:@"output_format"];
    }
    
    return self;
}



-(id)init
{
    
    return [self initWithType:nil];
    
}


-(NSString *)destination
{
    
    if (_destination)
        return _destination;
    
    if ([_type_name isEqualToString:@"rtmp"])
    {
        _destination = [NSString stringWithFormat:@"%@/%@", self.server_name, self.stream_key];
                
    }
    
    return _destination;
    
}


-(void)setDestination:(NSString *)destination
{
    
    NSLog(@"Destination set to %@", destination);
     _destination = destination;
    
}

-(id) initWithType:(NSString *)type
{
    if (self = [super init])
    {
        self.output_format = @"FLV";
        self.type_name = type;
        if ([type isEqualToString:@"twitchtv"])
        {
            self.output_format = @"FLV";
            self.name = @"Twitch.TV";
        }

    }
    return self;
    
    
}


-(NSString *)description
{
    
    return [NSString stringWithFormat:@"Name: %@ Type Name: %@ Destination %@ Key %@", self.name, self.type_name, self.destination, self.stream_key];
    
}
@end

