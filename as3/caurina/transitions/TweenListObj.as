﻿package caurina.transitions {

	/**
	 * The tween list object. Stores all of the properties and information that pertain to individual tweens.
	 *
	 * @author		Nate Chatellier, Zeh Fernando
	 * @version		1.0.3
	 */

	public class TweenListObj {
		
		protected var _scope				:Object;	// Object affected by this tweening
		protected var _properties			:Array;		// List of objects that control this tweening
			// name							:String		// Name of the property being tweened
			// valueStart					:Number		// Initial value of the property
			// valueComplete				:Number		// The value the property should have when completed
		protected var _timeStart			:Number;	// Time when this tweening should start
		protected var _timeComplete			:Number;	// Time when this tweening should end
		protected var _useFrames			:Boolean;	// Whether or not to use frames instead of time
		protected var _transition			:Function;	// Equation to control the transition animation
		protected var _onStart				:Function;	// Function to be executed on the object when the tween starts (once)
		protected var _onUpdate				:Function;	// Function to be executed on the object when the tween updates (several times)
		protected var _onComplete			:Function;	// Function to be executed on the object when the tween completes (once)
		protected var _onOverwrite			:Function;	// Function to be executed on the object when the tween is overwritten
		protected var _onStartParams		:Array;		// Array of parameters to be passed for the event
		protected var _onUpdateParams		:Array;		// Array of parameters to be passed for the event
		protected var _onCompleteParams		:Array;		// Array of parameters to be passed for the event
		protected var _onOverwriteParams	:Array;		// Array of parameters to be passed for the event
		protected var _rounded				:Boolean;	// Use rounded values when updating
		protected var _isPaused				:Boolean;	// Whether or not this tween is paused
		protected var _timePaused			:Number;	// Time when this tween was paused
		protected var _isCaller				:Boolean;	// Whether or not this tween is a "caller" tween
		protected var _count				:Number;	// Number of times this caller should be called
		protected var _timesCalled			:Number;	// How many times the caller has already been called ("caller" tweens only)
		protected var _waitFrames			:Boolean;	// Whether or not this caller should wait at least one frame for each call execution ("caller" tweens only)
		protected var _skipUpdates			:Number;	// How many updates should be skipped (default = 0; 1 = update-skip-update-skip...)
		protected var _updatesSkipped		:Number;	// How many updates have already been skipped
		protected var _hasStarted			:Boolean;	// Whether or not this tween has already started

		// ==================================================================================================================================
		// CONSTRUCTOR function -------------------------------------------------------------------------------------------------------------

		/**
		 * Initializes the basic TweenListObj.
		 * 
		 * @param	p_scope				Object		Object affected by this tweening
		 * @param	p_timeStart			Number		Time when this tweening should start
		 * @param	p_timeComplete		Number		Time when this tweening should end
		 * @param	p_useFrames			Boolean		Whether or not to use frames instead of time
		 * @param	p_transition		Function	Equation to control the transition animation
		 */
		function TweenListObj(p_scope:Object, p_timeStart:Number, p_timeComplete:Number, p_useFrames:Boolean, p_transition:Function) {
			_scope			=	p_scope;
			_timeStart		=	p_timeStart;
			_timeComplete	=	p_timeComplete;
			_useFrames		=	p_useFrames;
			_transition		=	p_transition;

			// Other default information
			_isPaused		=	false;
			_timePaused		=	undefined;
			_isCaller		=	false;
			_updatesSkipped	=	0;
			_timesCalled	=	0;
			_skipUpdates 	= 	0;
			_hasStarted		=	false;
		}


		// ==================================================================================================================================
		// GETTER/SETTER functions ----------------------------------------------------------------------------------------------------------
	
		public function get scope()				:Object		{ return _scope; }
		public function get properties()		:Array		{ return _properties; }
		public function get timeStart()			:Number		{ return _timeStart; }
		public function get timeComplete()		:Number		{ return _timeComplete; }
		public function get useFrames()			:Boolean	{ return _useFrames; }
		public function get transition()		:Function	{ return _transition; }
		public function get onStart()			:Function	{ return _onStart; }
		public function get onUpdate()			:Function	{ return _onUpdate; }
		public function get onComplete()		:Function	{ return _onComplete; }
		public function get onOverwrite()		:Function	{ return _onOverwrite; }
		public function get onStartParams()		:Array		{ return _onStartParams; }
		public function get onUpdateParams()	:Array		{ return _onUpdateParams; }
		public function get onCompleteParams()	:Array		{ return _onCompleteParams; }
		public function get onOverwriteParams()	:Array		{ return _onOverwriteParams; }
		public function get rounded()			:Boolean	{ return _rounded; }
		public function get isPaused()			:Boolean	{ return _isPaused; }
		public function get timePaused()		:Number		{ return _timePaused; }
		public function get isCaller()			:Boolean	{ return _isCaller; }
		public function get count()				:Number		{ return _count; }
		public function get timesCalled()		:Number		{ return _timesCalled; }
		public function get waitFrames()		:Boolean	{ return _waitFrames; }
		public function get skipUpdates()		:Number		{ return _skipUpdates; }
		public function get updatesSkipped()	:Number		{ return _updatesSkipped; }
		public function get hasStarted()		:Boolean	{ return _hasStarted; }
		
		public function set scope				(Scope:Object)				:void	{ _scope = Scope; }
		public function set properties			(Properties:Array)			:void	{ _properties = Properties; }
		public function set timeStart			(TimeStart:Number)			:void	{ _timeStart = TimeStart; }
		public function set timeComplete		(TimeComplete:Number)		:void	{ _timeComplete = TimeComplete; }
		public function set useFrames			(UseFrames:Boolean)			:void	{ _useFrames = UseFrames; }
		public function set transition			(Transition:Function)		:void	{ _transition = Transition; }
		public function set onStart				(OnStart:Function)			:void	{ _onStart = OnStart; }
		public function set onUpdate			(OnUpdate:Function)			:void	{ _onUpdate = OnUpdate; }
		public function set onComplete			(OnComplete:Function)		:void	{ _onComplete = OnComplete; }
		public function set onOverwrite			(OnOverwrite:Function)		:void	{ _onOverwrite = OnOverwrite; }
		public function set onStartParams		(OnStartParams:Array)		:void	{ _onStartParams = OnStartParams; }
		public function set onUpdateParams		(OnUpdateParams:Array)		:void	{ _onUpdateParams = OnUpdateParams; }
		public function set onCompleteParams	(OnCompleteParams:Array)	:void	{ _onCompleteParams = OnCompleteParams; }
		public function set onOverwriteParams	(OnOverwriteParams:Array)	:void	{ _onOverwriteParams = OnOverwriteParams; }
		public function set rounded				(Rounded:Boolean)			:void	{ _rounded = Rounded; }
		public function set isPaused			(IsPaused:Boolean)			:void	{ _isPaused = IsPaused; }
		public function set timePaused			(TimePaused:Number)			:void	{ _timePaused = TimePaused; }
		public function set isCaller			(IsCaller:Boolean)			:void	{ _isCaller = IsCaller; }
		public function set count				(Count:Number)				:void	{ _count = Count; }
		public function set timesCalled			(TimesCalled:Number)		:void	{ _timesCalled = TimesCalled; }
		public function set waitFrames			(WaitFrames:Boolean)		:void	{ _waitFrames = WaitFrames; }
		public function set skipUpdates			(SkipUpdates:Number)		:void	{ _skipUpdates = SkipUpdates; }
		public function set updatesSkipped		(UpdatesSkipped:Number)		:void	{ _updatesSkipped = UpdatesSkipped; }
		public function set hasStarted			(HasStarted:Boolean)		:void	{ _hasStarted = HasStarted; }


		// ==================================================================================================================================
		// OTHER functions ------------------------------------------------------------------------------------------------------------------
	
		/**
		 * Clones this tweening and returns the new TweenListObj
		 *
		 * @param	omitEvents		Boolean			Whether or not events such as onStart (and its parameters) should be omitted
		 * @return 					TweenListObj	A copy of this object
		 */
		public function clone(omitEvents:Boolean):TweenListObj {
			var nTween:TweenListObj = new TweenListObj(scope, timeStart, timeComplete, useFrames, transition);
			nTween.properties = new Array();
			var i:uint;
			for (i = 0; i < properties.length; i++) {
				nTween.properties.push({name:properties[i].name, valueStart:properties[i].valueStart, valueComplete:properties[i].valueComplete});
			}
			nTween.skipUpdates = skipUpdates;
			nTween.updatesSkipped = updatesSkipped;
			if (!omitEvents) {
				nTween.onStart = onStart;
				nTween.onUpdate = onUpdate;
				nTween.onComplete = onComplete;
				nTween.onOverwrite = onOverwrite;
				nTween.onStartParams = onStartParams;
				nTween.onUpdateParams = onUpdateParams;
				nTween.onCompleteParams = onCompleteParams;
				nTween.onOverwriteParams = onOverwriteParams;
			}
			nTween.rounded = rounded;
			nTween.isPaused = isPaused;
			nTween.timePaused = timePaused;
			nTween.isCaller = isCaller;
			nTween.count = count;
			nTween.timesCalled = timesCalled;
			nTween.waitFrames = waitFrames;
			nTween.hasStarted = hasStarted;

			return nTween;
		}

		/**
		 * Returns this object described as a String.
		 *
		 * @return 					String		The description of this object.
		 */
		public function toString():String {
			var returnStr:String = "\n[TweenListObj ";
			returnStr += "scope:" + String(scope);
			returnStr += ", properties:";
			for (var i:uint = 0; i < properties.length; i++) {
				if (i > 0) returnStr += ",";
				returnStr += "[name:"+properties[i].name;
				returnStr += ",valueStart:"+properties[i].valueStart;
				returnStr += ",valueComplete:"+properties[i].valueComplete;
				returnStr += "]";
			} // END FOR
			returnStr += ", timeStart:" + String(timeStart);
			returnStr += ", timeComplete:" + String(timeComplete);
			returnStr += ", useFrames:" + String(useFrames);
			returnStr += ", transition:" + String(transition);

			if (skipUpdates)		returnStr += ", skipUpdates:"		+ String(skipUpdates);
			if (updatesSkipped)		returnStr += ", updatesSkipped:"	+ String(updatesSkipped);

			if (Boolean(onStart))			returnStr += ", onStart:"			+ String(onStart);
			if (Boolean(onUpdate))			returnStr += ", onUpdate:"			+ String(onUpdate);
			if (Boolean(onComplete))		returnStr += ", onComplete:"		+ String(onComplete);
			if (Boolean(onOverwrite))		returnStr += ", onOverwrite:"		+ String(onOverwrite);

			if (onStartParams)		returnStr += ", onStartParams:"		+ String(onStartParams);
			if (onUpdateParams)		returnStr += ", onUpdateParams:"	+ String(onUpdateParams);
			if (onCompleteParams)	returnStr += ", onCompleteParams:"	+ String(onCompleteParams);
			if (onOverwriteParams)	returnStr += ", onOverwriteParams:"	+ String(onOverwriteParams);

			if (rounded)			returnStr += ", rounded:"			+ String(rounded);
			if (isPaused)			returnStr += ", isPaused:"			+ String(isPaused);
			if (timePaused)			returnStr += ", timePaused:"		+ String(timePaused);
			if (isCaller)			returnStr += ", isCaller:"			+ String(isCaller);
			if (count)				returnStr += ", count:"				+ String(count);
			if (timesCalled)		returnStr += ", timesCalled:"		+ String(timesCalled);
			if (waitFrames)			returnStr += ", waitFrames:"		+ String(waitFrames);
			if (hasStarted)			returnStr += ", hasStarted:"		+ String(hasStarted);
			
			returnStr += "]\n";
			return returnStr;
		}
		
	}

}
